ó
ÏÖbc           @   sù  d  d l  m Z d  d l m Z d  d l m Z d  d l m Z d  d l Z d  d l	 m
 Z
 d  d l Td  d l m Z d  d	 l m Z d
   Z d   Z d   Z d   Z d   Z e d k rõe d d  e d d  d Z x+ e e  D] Z e d e e  d  qì We d d  e d d d  e d d  e d d  d Z xZ e e  D]L Z e d d e e  d e e d   e d d e e d  d  qWWe d  d d  e d  d! d"  e d  d# d  e d$ d  e   e   n  d S(%   iÿÿÿÿ(   t   pause(   t   Empty(   t   position(   t   PoseStampedN(   t   Odometry(   t   *(   t   KnowledgeItem(   t   KeyValuec         C   s³   t  j d  y~ t  j d |  d |  t  j d t  } t   } t j | _ |  | _ | j	 j
 t j j d |   | t j |  } Wn! t  j k
 r® t  j d  n Xd  S(   Ns   rosplan_knowledge_base/updates	   Add Goal t    t   ds   Service call failed(   t   rospyt   wait_for_servicet   loginfot   ServiceProxyt   KnowledgeUpdateServiceR   t   FACTt   knowledge_typet   attribute_namet   valuest   appendt   diagnostic_msgst   msgR   t   KnowledgeUpdateServiceRequestt   ADD_GOALt   ServiceException(   t	   goal_factt   goal_objt   update_clientt	   knowledget   resp(    (    sC   /home/edson/ws_demeter/src/demeter_planning/scripts/problem_init.pyt   add_goal   s    		c          C   s   t  j d  y_ t  j d  t  j d t  }  t   } t j | _ d | _ g  | j	 _
 |  t j |  } Wn! t  j k
 r t  j d  n Xd  S(   Ns   rosplan_knowledge_base/updates   Add Metric: Minimize total times   minimize (total-time)s   Service call failed(   R
   R   R   R   R   R   t
   EXPRESSIONR   t   optimizationt   exprt   tokensR   t
   ADD_METRICR   (   R   R   R   (    (    sC   /home/edson/ws_demeter/src/demeter_planning/scripts/problem_init.pyt   add_metric_min_total_time   s    		c         C   s   t  j d  yd t  j d |  d  t  j d t  } t   } t j | _ | | _ |  | _	 | t
 j |  } Wn! t  j k
 r t  j d  n Xd  S(   Ns   rosplan_knowledge_base/updates   Add s    Objects   Service call failed(   R
   R   R   R   R   R   t   INSTANCER   t   instance_typet   instance_nameR   t   ADD_KNOWLEDGER   (   t   obj_namet   obj_typeR   R   R   (    (    sC   /home/edson/ws_demeter/src/demeter_planning/scripts/problem_init.pyt
   add_object&   s    			c          G   sõ   t  j d  yÀ t  j d t  } t   } t j | _ |  d | _ | j j	 t
 j j d |  d   t |   d k r | j j	 t
 j j d |  d   n  t  j d t |   d	  | t j |  } Wn! t  j k
 rð t  j d
  n Xd  S(   Ns   rosplan_knowledge_base/updatei    t   vi   i   t   wi   s   Add s    Facts   Service call failed(   R
   R   R   R   R   R   R   R   R   R   R   R   R   t   lenR   t   strR   R(   R   (   t   factR   R   R   (    (    sC   /home/edson/ws_demeter/src/demeter_planning/scripts/problem_init.pyt   add_fact3   s    	#&c           C   sv   t  j d  t  j d  y1 t  j d  t  j d t    t  j d  Wn$ t  j  j k
 rq t  j d  n Xd  S(   Ns&   Waiting for problem generation services3   rosplan_problem_interface/problem_generation_servers"   Calling problem generation services   Problem file updateds&   Service problem generation call failed(   R
   R   R   R   R   R   (    (    (    sC   /home/edson/ws_demeter/src/demeter_planning/scripts/problem_init.pyt   problem_generationC   s    t   __main__t   data1t   datat   vehicle1t   vehiclei   t   wpt   waypointt   emptys   is-int   wp6s   is-at-surfacet   wp0t   wp1i   s   can-movei   s   can-findt   wp2t   wp3t   wp5s	   data-sent(   t   signalR    t   std_srvs.srvR   t   turtleR   t   geometry_msgs.msgR   R
   t   nav_msgs.msgR   t   rosplan_knowledge_msgs.srvt   rosplan_knowledge_msgs.msgR   t   diagnostic_msgs.msgR   R   R$   R+   R1   R2   t   __name__t   n_waypointst   ranget   iR/   t	   n_canmove(    (    (    sC   /home/edson/ws_demeter/src/demeter_planning/scripts/problem_init.pyt   <module>   sB   
					("