#!/usr/bin/env python

# 3rd Party Packages
from threading import Lock

# ROS Packages
import rospy
from diagnostic_msgs.msg import KeyValue
from std_srvs.srv import Empty
from rosplan_dispatch_msgs.msg import ActionDispatch, ActionFeedback
from rosplan_knowledge_msgs.msg import KnowledgeItem, diagnostic_msgs
from rosplan_knowledge_msgs.srv import (GetDomainOperatorDetailsService,
                                        GetDomainPredicateDetailsService,
                                        KnowledgeUpdateService,
                                        KnowledgeUpdateServiceRequest,
                                        KnowledgeQueryService)
from action_interface import DemeterActionInterface
import threading

class DemeterInterface(object):

    mutex = Lock()

    def __init__(self, demeter=None, update_frequency=10.):
        """
        A Class that interfaces ROSPlan and DEMETER for executing actions
        """
        if demeter is None:
            self.demeter = DemeterActionInterface()
        self.demeter = demeter
        self.namespace = self.demeter.namespace
        self.demeter_arrived = False
        self.demeter_wp = -1
        self.query = []
        self.verify_localization_errors = []
        
        # Service proxies (KB: update, predicate and operator details)
        rospy.loginfo('Waiting for service'+ str(self.namespace) +'rosplan_knowledge_base/update ...')
        rospy.wait_for_service(str(self.namespace) +'rosplan_knowledge_base/update')
        self._knowledge_update_proxy = rospy.ServiceProxy(self.namespace +'rosplan_knowledge_base/update', KnowledgeUpdateService)
        rospy.loginfo('Waiting for '+ str(self.namespace) +'rosplan_knowledge_base/domain/predicate_details ...')
        rospy.wait_for_service(str(self.namespace) +'rosplan_knowledge_base/domain/predicate_details')
        self._predicate_proxy = rospy.ServiceProxy(str(self.namespace) +'rosplan_knowledge_base/domain/predicate_details', GetDomainPredicateDetailsService)
        rospy.wait_for_service(str(self.namespace) +'rosplan_knowledge_base/domain/operator_details')
        self._operator_proxy = rospy.ServiceProxy(str(self.namespace) +'rosplan_knowledge_base/domain/operator_details', GetDomainOperatorDetailsService)
        # Subscribers
        rospy.Subscriber(str(self.namespace) +'rosplan_plan_dispatcher/action_dispatch', ActionDispatch, self._dispatch_cb, queue_size=10)
        # Publishers
        self._feedback_publisher = rospy.Publisher(str(self.namespace) +'rosplan_plan_dispatcher/action_feedback', ActionFeedback, queue_size=10)
        self._rate = rospy.Rate(update_frequency)

        # Auto call functions
        rospy.Timer(self._rate.sleep_dur, self.knowledge_update)

    def _apply_operator_effect(self, op_name, dispatch_params):
        predicate_names = list()
        parameters = list()
        update_types = list()
        response = self._operator_proxy(op_name)
        predicates = (response.op.at_start_add_effects + response.op.at_end_add_effects)
        for predicate in predicates:
            predicate_names.append(predicate.name)
            params = list()
            for typed_param in predicate.typed_parameters:
                for param in dispatch_params:
                    if typed_param.key == param.key:
                        params.append(param)
                        break
            parameters.append(params)
            update_types.append(KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
        predicates = (response.op.at_start_del_effects + response.op.at_end_del_effects)
        for predicate in predicates:
            predicate_names.append(predicate.name)
            params = list()
            for typed_param in predicate.typed_parameters:
                for param in dispatch_params:
                    if typed_param.key == param.key:
                        params.append(param)
                        break
            parameters.append(params)
            update_types.append(KnowledgeUpdateServiceRequest.REMOVE_KNOWLEDGE)
        succeed = self.update_predicates(predicate_names, parameters, update_types)
        return succeed
    import threading

    def _dispatch_cb(self, msg):
        duration = rospy.Duration(msg.duration)
        # Parse action message
        if msg.name == 'move':
            self._action_threaded(msg, self.move, [msg.parameters, duration])
        if msg.name == 'submerge-mission':
            self._action_threaded(msg, self.submerge_mission, [msg.parameters, duration])
        if msg.name == 'transmit-data':
            self._action_threaded(msg, self.transmit_data, [duration])
        if msg.name == 'wait-to-recharge':
            self._action_threaded(msg, self.wait_to_recharge, [duration])
        if msg.name == 'localize-cable':
            self._action_threaded(msg, self.localize_cable, [msg.parameters, duration])

    def _action_threaded(self, action_dispatch, action_func, action_params=list()):
        # Create a new thread for the action function
        action_thread = threading.Thread(target=self._action, args=[action_dispatch, action_func, action_params])
        action_thread.start()

    def _action(self, action_dispatch, action_func, action_params=list()):
        self.current_action_id=action_dispatch.action_id
        print(self.current_action_id)
        self.publish_feedback(action_dispatch.action_id, ActionFeedback.ACTION_ENABLED)
        start_time = rospy.Time(action_dispatch.dispatch_time)
        duration = rospy.Duration(action_dispatch.duration)
        self._rate.sleep()
        rospy.loginfo('Dispatching %s action at %s with duration %s ...' %(action_dispatch.name, str(start_time.secs), str(duration.to_sec())))   
            
        if action_func(*action_params) == self.demeter.ACTION_SUCCESS:
            if self._apply_operator_effect(action_dispatch.name,action_dispatch.parameters):
                self.publish_feedback(action_dispatch.action_id,ActionFeedback.ACTION_SUCCEEDED_TO_GOAL_STATE)
            else:
                self.publish_feedback(action_dispatch.action_id, ActionFeedback.ACTION_FAILED)
                rospy.logwarn('Action Failed, action_id: ' + str(action_dispatch.action_id) + ' action_name: ' + str(action_dispatch.name) + ' action_dispatch.parameters: ' + str(action_dispatch.parameters))
                self.cancel_plan()
        else:
            self.publish_feedback(action_dispatch.action_id, ActionFeedback.ACTION_FAILED)
            rospy.logwarn('Action Failed - Timeout, action_id: ' + str(action_dispatch.action_id) + ' action_name: ' + str(action_dispatch.name) + ' action_dispatch.parameters: ' + str(action_dispatch.parameters))
            self.cancel_plan()


    def cancel_plan(self):
        _cancel_plan_proxy = rospy.ServiceProxy(str(self.namespace)+'/rosplan_plan_dispatcher/cancel_dispatch', Empty)
        _cancel_plan_proxy()

    def knowledge_update(self, event):
        self.KB_update_waypoint()
        
    def KB_update_waypoint(self):
        pred_names = list()
        params = list()
        update_types = list()
        wp_seq = self.demeter._current_wp  # demeter position in waypoint update
        
        if wp_seq != -1 and self.demeter_wp != wp_seq:  # add current wp that demeter resides
            pred_names.append('at')
            params.append(
                [KeyValue('v', 'vehicle'),
                 KeyValue('wp', 'wp%d' % wp_seq)])
            update_types.append(KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
            if self.demeter_wp != -1:  # Remove previous wp that demeter resided
                pred_names.append('at')
                params.append([
                    KeyValue('v', 'vehicle1'),
                    KeyValue('wp', 'wp%d' % self.demeter_wp)
                ])
                update_types.append(KnowledgeUpdateServiceRequest.REMOVE_KNOWLEDGE)
            self.demeter_wp = wp_seq

    def update_instances(self, ins_types, ins_names, update_types):   
        success = True
        for idx, ins_type in enumerate(ins_types):
            req = KnowledgeUpdateServiceRequest()
            req.knowledge.knowledge_type = KnowledgeItem.INSTANCE
            req.knowledge.instance_type = ins_type
            req.knowledge.instance_name = ins_names[idx]
            req.update_type = update_types[idx]
            success = success and self._knowledge_update_proxy(req).success
        return success

    def update_predicates(self, pred_names, parameters, update_types):
        self.mutex.acquire()
        success = True
        for idx, pred_name in enumerate(pred_names):
            req = KnowledgeUpdateServiceRequest()
            req.knowledge.knowledge_type = KnowledgeItem.FACT
            req.knowledge.attribute_name = pred_name
            req.knowledge.values.extend(parameters[idx])
            req.update_type = update_types[idx]
            success = success and self._knowledge_update_proxy(req).success
        self.mutex.release()
        return success

    def update_functions(self, func_names, params, func_values, update_types):
        self.mutex.acquire()
        success = True
        for idx, func_name in enumerate(func_names):
            req = KnowledgeUpdateServiceRequest()
            req.knowledge.knowledge_type = KnowledgeItem.FUNCTION
            req.knowledge.attribute_name = func_name
            req.knowledge.values = params[idx]
            req.knowledge.function_value = func_values[idx]
            req.update_type = update_types[idx]
            success = success and self._knowledge_update_proxy(req).success
        self.mutex.release()
        return success

    def publish_feedback(self, action_id, fbstatus):
        feedback = ActionFeedback()
        feedback.action_id = action_id
        feedback.status = fbstatus
        self._feedback_publisher.publish(feedback)     
        
    def get_robot_position(self):
        return self.demeter.get_position()
    
    def get_closer_waypoint(self):
        return self.demeter.closer_wp(self.demeter.get_position())

    def move(self, dispatch_params, duration=rospy.Duration(60, 0)):
        waypoint = -1
        for param in dispatch_params:
            if param.key == 'z': # to Waypoint z
                waypoint = int(param.value[8:])
                break
        response = self.demeter.do_move(waypoint, duration) if waypoint != -1 else self.demeter.ACTION_FAIL
        return response

    def submerge_mission(self, dispatch_params, duration=rospy.Duration(60, 0)):
        data_location = -1
        for param in dispatch_params:
            if param.key == 'd': # from Data d
                data_location = int(param.value[4:])
                break
        response = self.demeter.do_submerge_mission(data_location, duration) if data_location != -1 else self.demeter.ACTION_FAIL
        return response
    
    def transmit_data(self, duration=rospy.Duration(60, 0)):
        response = self.demeter.do_transmit_data(duration)
        return response
    
    def wait_to_recharge(self, duration=rospy.Duration(60, 0)):
        response = self.demeter.do_wait_to_recharge(duration)
        return response
    
    def localize_cable(self, dispatch_params, duration=rospy.Duration(60, 0)):
        for param in dispatch_params:
            if param.key == 'tu': # to Waypoint z
                turbine = param.value[7:]
                break
        response = self.demeter.do_localize_cable(turbine, duration)
        return response
    
    
    