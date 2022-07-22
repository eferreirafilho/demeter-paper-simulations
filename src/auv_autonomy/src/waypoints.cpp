#include "iostream"
#include "ros/ros.h"
#include "nav_msgs/Odometry.h"
#include "geometry_msgs/PoseStamped.h"
#include "iostream"

using namespace std;

class Waypoints
{  
  ros::NodeHandle node;
  ros::Subscriber sub_odom;
  ros::Publisher pub_cmd_pose;

  nav_msgs::Odometry odom;

  string odom_topic,cmd_pose_topic;

  int loop_rate;

  bool waypoints_loaded;
  bool waypoint_reached;
  bool final_waypoint;
  bool odometry_set;
  int current_waypoint;
  vector <double> way_x,way_y,way_z,way_delay;

  double d_waypoint;

  int state;
  bool state_first_time;

  struct timespec start;

public:
  Waypoints();

  void OdomCallback(const nav_msgs::Odometry::ConstPtr& msg);
  void Release();

  int GetLoopRate();
  void SpinOnce();
  void PublishPose(int indx);
};

Waypoints::Waypoints()
{
  string node_name;

  node_name = ros::this_node::getName();

  node.param(node_name+"/odom_topic",odom_topic,(string)"odom");
  node.param(node_name+"/cmd_pose_topic",cmd_pose_topic,(string)"cmd_pose");
  node.param(node_name+"/loop_rate",loop_rate,(int)5);
  node.param(node_name+"/Dwaypoint",d_waypoint,(double)0.1);


  waypoints_loaded = true;
  if(!node.getParam(node_name+"/way_x",way_x))
  { 
    ROS_ERROR("Waypoints x missing");
    waypoints_loaded = false;
  }
  if(!node.getParam(node_name+"/way_y",way_y))
  { 
    ROS_ERROR("Waypoints y missing");
    waypoints_loaded = false;
  }
  if(!node.getParam(node_name+"/way_z",way_z))
  { 
    ROS_ERROR("Waypoints z missing");
    waypoints_loaded = false;
  }
  if(!node.getParam(node_name+"/way_delay",way_delay))
  {
    ROS_ERROR("Waypoints delay missing");
    if(waypoints_loaded)
      for(int i=0;i<way_x.size();i++)
        way_delay.push_back(0);
  }

  if(way_x.size() != way_y.size())
  {
    ROS_ERROR("way_x and way_y are not the same size");
    waypoints_loaded = false;
  }
  if(way_x.size() != way_z.size())
  {
    ROS_ERROR("way_z is not the same size as way_x, way_y");
    waypoints_loaded = false;
  }

  if(way_x.size() != way_delay.size())
  {
    ROS_ERROR("way_delay is not the same size as way_x, way_y");
    waypoints_loaded = false;
  }

  ROS_INFO("Waypoints list loaded");
  
  current_waypoint = 0;

  odometry_set = false;
  waypoint_reached = false;
  final_waypoint = false;

  state = 0;
  state_first_time = true;


  sub_odom = node.subscribe(odom_topic, 10, &Waypoints::OdomCallback,this);

  pub_cmd_pose = node.advertise<geometry_msgs::PoseStamped>(cmd_pose_topic, 1, true);

}

void Waypoints::Release()
{
}

double angle_pi(double angle)
{
  if(angle>M_PI)
    return angle - 2*M_PI;
  if(angle<-M_PI)
    return angle + 2*M_PI;

  return angle;
}

void Waypoints::OdomCallback(const nav_msgs::Odometry::ConstPtr& msg)
{
  odom.pose.pose.position.x = msg->pose.pose.position.x;
  odom.pose.pose.position.y = msg->pose.pose.position.y;
  odom.pose.pose.position.z = msg->pose.pose.position.z;

  odom.pose.pose.orientation.x = msg->pose.pose.orientation.x;
  odom.pose.pose.orientation.y = msg->pose.pose.orientation.y;
  odom.pose.pose.orientation.z = msg->pose.pose.orientation.z;
  odom.pose.pose.orientation.w = msg->pose.pose.orientation.w;


  odometry_set = true;
}



int Waypoints::GetLoopRate()
{
  return loop_rate;
}

void Waypoints::PublishPose(int indx)
{
  geometry_msgs::PoseStamped msg_pose;

  msg_pose.header.stamp = ros::Time::now();

  msg_pose.pose.position.x = way_x[indx];
  msg_pose.pose.position.y = way_y[indx];
  msg_pose.pose.position.z = way_z[indx];
  
  msg_pose.pose.orientation.x = 0;
  msg_pose.pose.orientation.y = 0;
  msg_pose.pose.orientation.z = 0;
  msg_pose.pose.orientation.w = 1;

  pub_cmd_pose.publish(msg_pose);

  ROS_INFO("Pose published  x: %.2f  y: %.2f  z: %.2f ",msg_pose.pose.position.x,msg_pose.pose.position.y,msg_pose.pose.position.z);

}

void Waypoints::SpinOnce()
{
  double d;

  switch(state)
  {
    case 0:  // Init
      {
        if(state_first_time)
        {
          state_first_time = false;
        }

        if(odometry_set)
        {
          PublishPose(0);

          state_first_time = true;
          state = 1;
        }
      }
      break;
    case 1: // Go to waypoint
      {
        if(state_first_time)
        {
          state_first_time = false;
        }

        d = sqrt(pow(odom.pose.pose.position.x-way_x[current_waypoint],2) +
                 pow(odom.pose.pose.position.y-way_y[current_waypoint],2) +
                 pow(odom.pose.pose.position.z-way_z[current_waypoint],2));

        if(d<d_waypoint)
        {
          ROS_INFO("Waypoint %d reached",current_waypoint);
          state_first_time = true;
          state = 2;
        }
      }
      break;
    case 2:  // Wait
      {
        if(state_first_time)
        {
          clock_gettime(CLOCK_MONOTONIC,&start);

          state_first_time = false;
        }

        struct timespec now;
        clock_gettime(CLOCK_MONOTONIC,&now);

        double dt = (double)(now.tv_sec-start.tv_sec) + (double)(now.tv_nsec-start.tv_nsec)/1e9;

        if(dt>way_delay[current_waypoint])
        {
          if(current_waypoint < way_x.size()-1)
          {
            current_waypoint++;
            PublishPose(current_waypoint);
            state = 1;
          }
          else
          {
            final_waypoint = true;
            state = 3;
          }
          state_first_time = true;
        }

      }
      break;
    case 3:   // Finished
        if(state_first_time)
        {
          ROS_INFO("Waypoint list finished");

          state_first_time = false;
        }
      break;
  }
}

int main(int argc, char **argv)
{

  ROS_INFO("Initialising Waypoints Ros connection");

  ros::init(argc, argv, "auv_waypoints");

  ROS_INFO("Waypoints Ros connected");

  Waypoints auv_waypoints;

  ros::Rate loop_rate(auv_waypoints.GetLoopRate());

  while(ros::ok())
  {
    ros::spinOnce();
    auv_waypoints.SpinOnce();
    loop_rate.sleep();
  }

  return 0;
}


