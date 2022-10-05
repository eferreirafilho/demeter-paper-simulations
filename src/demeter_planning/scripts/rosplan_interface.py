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
from interface import DemeterActionInterface

class DemeterInterface(object):

    mutex = Lock()

    def __init__(self, demeter=None, update_frequency=10.):
        """
        A Class that interfaces ROSPlan and DEMETER for executing actions
        """
        if demeter is None:
            self.demeter = DemeterActionInterface()
        self.demeter = demeter
        # self.name = name
        self.demeter_arrived = False
        self.demeter_wp = -1
        self.query = []
        self.verify_localization_errors = []
        
        # Service proxies (KB: update, predicate and operator details)
        rospy.loginfo('Waiting for service /rosplan_knowledge_base/update ...')
        rospy.wait_for_service('/rosplan_knowledge_base/update')
        self._knowledge_update_proxy = rospy.ServiceProxy('/rosplan_knowledge_base/update', KnowledgeUpdateService)
        rospy.loginfo('Waiting for /rosplan_knowledge_base/domain/predicate_details ...')
        rospy.wait_for_service('/rosplan_knowledge_base/domain/predicate_details')
        self._predicate_proxy = rospy.ServiceProxy('/rosplan_knowledge_base/domain/predicate_details', GetDomainPredicateDetailsService)
        rospy.wait_for_service('/rosplan_knowledge_base/domain/operator_details')
        self._operator_proxy = rospy.ServiceProxy('/rosplan_knowledge_base/domain/operator_details', GetDomainOperatorDetailsService)
        # Subscribers
        rospy.Subscriber('/rosplan_plan_dispatcher/action_dispatch', ActionDispatch, self._dispatch_cb, queue_size=10)
        # Publishers
        self._feedback_publisher = rospy.Publisher('/rosplan_plan_dispatcher/action_feedback', ActionFeedback, queue_size=10)
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

    def _dispatch_cb(self, msg):
        duration = rospy.Duration(msg.duration)
        # Parse action message
        if msg.name == 'move':
            self._action(msg, self.move, [msg.parameters, duration])
        if msg.name == 'get_data':
            self._action(msg, self.get_data, [duration])
        if msg.name == 'transmit_data':
            self._action(msg, self.transmit_data, [duration])
                
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
                rospy.logwarn('Action Failed')
                self.cancel_plan()
        else:
            self.publish_feedback(action_dispatch.action_id, ActionFeedback.ACTION_FAILED)
            rospy.logwarn('Action Failed - Timeout')
            self.cancel_plan()

    def cancel_plan(self):
        _cancel_plan_proxy = rospy.ServiceProxy('/rosplan_plan_dispatcher/cancel_dispatch', Empty)
        _cancel_plan_proxy()

    def call_query_service(self):
        rospy.wait_for_service('/rosplan_knowledge_base/query_state')
        try:
            query_proxy = rospy.ServiceProxy('rosplan_knowledge_base/query_state', KnowledgeQueryService)
            resp1 = query_proxy(self.query)
            return resp1.results
        except rospy.ServiceException:
            rospy.loginfo("Service query call failed")

    def data_sent_kb_query(self):
        query1 = KnowledgeItem()
        query1.knowledge_type = KnowledgeItem.FACT
        query1.attribute_name = "data-sent"
        query1.values.append(diagnostic_msgs.msg.KeyValue("d","data1"))
        self.query.append(query1)
        self._rate.sleep()
        result = self.call_query_service()
        return result[-1]

    def clear_data_sent_fact(self):
        self.data_sent_kb_query()
        if self.call_query_service():
            pred_names = [
            'data-sent'
            ]
            params = [[KeyValue('d', 'data1')]]
            update_types = [
                KnowledgeUpdateServiceRequest.REMOVE_KNOWLEDGE,
            ]
            self.update_predicates(pred_names,params,update_types)

    def clear_carry_vehicle_fact(self):
        if self.call_query_service():
            pred_names = [
            'carry'
            ]
            params = [[KeyValue('v', 'vehicle1'), KeyValue('d', 'data1')]]
            update_types = [
                KnowledgeUpdateServiceRequest.REMOVE_KNOWLEDGE,
            ]
            self.update_predicates(pred_names,params,update_types)

    def add_empty_vehicle_fact(self):
        pred_names = [
        'empty'
        ]
        params = [[KeyValue('v', 'vehicle1')]]
        update_types = [
            KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE,
        ]
        self.update_predicates(pred_names,params,update_types)

    def knowledge_update(self, event):
        self.KB_update_waypoint()
        self.KB_update_localization_error()
        
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

    def KB_update_localization_error(self):
        pred_names = list()
        params = list()
        update_types = list()
        pred_names.append('localized')
        params.append([KeyValue('v', 'vehicle1')])
        if not self.verify_localization_errors:
            update_types.append(KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
        else:    
            if self.demeter.localized:
                update_types.append(KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
            else:
                update_types.append(KnowledgeUpdateServiceRequest.REMOVE_KNOWLEDGE)

    def verify_localization_errors_on(self):
        self.verify_localization_errors = True
        self.demeter.interface_verify_localization_errors_on()

    def verify_localization_errors_off(self):
        self.verify_localization_errors = False
        self.demeter.interface_verify_localization_errors_off()

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

    def move(self, dispatch_params, duration=rospy.Duration(60, 0)):
        waypoint = -1
        for param in dispatch_params:
            if param.key == 'z': # to Waypoint z
                waypoint = int(param.value[2:])
                break
        response = self.demeter.do_move(waypoint, duration) if waypoint != -1 else self.demeter.ACTION_FAIL
        return response

    def get_data(self, duration=rospy.Duration(60, 0)):
        response = self.demeter.do_get_data(duration)
        return response
    
    def transmit_data(self, duration=rospy.Duration(60, 0)):
        response = self.demeter.do_transmit_data(duration)
        return response
        
    def surface(self):
        self.demeter.goto_surface()
        return True

    def send_to_origin(self):
        self.demeter.goto_origin()
        return True

    def localize_rotate(self):
        self.demeter.rotate_in_place()
        return True

    def interface_halt(self):
        self.demeter.command_halt_vehicle()
        return True