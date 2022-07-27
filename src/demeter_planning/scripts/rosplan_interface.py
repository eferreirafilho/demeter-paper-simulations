#!/usr/bin/env python

from sre_constants import SUCCESS
from threading import Lock

# 3rd Party Packages

# ROS Packages
import rospy
from diagnostic_msgs.msg import KeyValue
from rosplan_dispatch_msgs.msg import ActionDispatch, ActionFeedback
from rosplan_knowledge_msgs.msg import KnowledgeItem
from rosplan_knowledge_msgs.srv import (GetDomainOperatorDetailsService,
                                        GetDomainPredicateDetailsService,
                                        KnowledgeUpdateService,
                                        KnowledgeUpdateServiceRequest)
from interface import DemeterActionInterface


class DemeterInterface(object):

    mutex = Lock()


    def __init__(self, name='DEMETER1', demeter=None, update_frequency=10.):
        """
        A Class that interfaces ROSPlan and DEMETER for executing actions
        """
        if demeter is None:
            self.demeter = DemeterActionInterface()
        self.demeter = demeter
        self.name = name
        self.demeter_arrived = False
        self.demeter_wp = -1
        
        # Verify initial position of robot
        # self.init_position()

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
        """
        Add / remove knowledge based on operator effect and parameters from dispatched action
        """
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
        """
        Function for action_dispatch callback
        """
        # rospy.loginfo('%s: action received' % self.name)
        duration = rospy.Duration(msg.duration)
        # parse action message
        if msg.name == 'move':
            self._action(msg, self.move, [msg.parameters, duration])
        if msg.name == 'get_data':
            self._action(msg, self.get_data, [duration])
        if msg.name == 'transmit_data':
            self._action(msg, self.transmit_data, [duration])
                
    def _action(self, action_dispatch, action_func, action_params=list()):
        """
        Template vehicle action for generic action
        """
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
                rospy.loginfo('Action Failed 1')
                
        else:
            self.publish_feedback(action_dispatch.action_id, ActionFeedback.ACTION_FAILED)
            rospy.loginfo('Action Failed 2')

    def knowledge_update(self, event):
        """
        Add or remove facts related to this vehicle at ROSPlan knowledge base
        """
        pred_names = list()
        params = list()
        update_types = list()
        # demeter position in waypoint update
        wp_seq = self.demeter._current_wp
        
        # only update when self.demeter_wp != wp_seq
        if wp_seq != -1 and self.demeter_wp != wp_seq:
            # add current wp that demeter resides
            pred_names.append('at')
            params.append(
                [KeyValue('v', self.name),
                 KeyValue('wp', 'wp%d' % wp_seq)])
            update_types.append(KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
            # remove previous wp that demeter resided
            if self.demeter_wp != -1:
                pred_names.append('at')
                params.append([
                    KeyValue('v', self.name),
                    KeyValue('wp', 'wp%d' % self.demeter_wp)
                ])
                update_types.append(KnowledgeUpdateServiceRequest.REMOVE_KNOWLEDGE)
            self.uav_wp = wp_seq

    def update_instances(self, ins_types, ins_names, update_types):
        """
        Add / remove instances
        """
        rospy.loginfo('update instances method')
        
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
        """
        Add / remove first order facts or goals
        """
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
        """
        Add / remove functions
        """
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
        """
        Function to publish action feedback to action_feedback topic
        """
        feedback = ActionFeedback()
        feedback.action_id = action_id
        feedback.status = fbstatus
        self._feedback_publisher.publish(feedback)

    def move(self, dispatch_params, duration=rospy.Duration(60, 0)):
        """
        Go to waypoint action for Vehicle
        """
        waypoint = -1
        for param in dispatch_params:
            if param.key == 'z': # to Waypoint z
                waypoint = int(param.value[2:])
                break
        response = self.demeter.do_move(waypoint, duration) if waypoint != -1 else self.demeter.ACTION_FAIL
        return response

    def get_data(self, duration=rospy.Duration(60, 0)):
        """
        Get data action for Vehicle
        """
        response = self.demeter.do_get_data(duration)
        return response
    
    def transmit_data(self, duration=rospy.Duration(60, 0)):
        """
        Get data action for Vehicle
        """
        response = self.demeter.do_transmit_data(duration)
        return response
    
    def initial_position(self):
        success = True
        if not self.demeter.is_submerged():
            rospy.logwarn('Vehicle at the surface')
            # TODO Add fact to KB
            return success
        else:
            rospy.logwarn('Vehicle is submerged')
            while self.demeter.is_submerged() and not (rospy.is_shutdown()):
                self.demeter.goto_surface()
            return success