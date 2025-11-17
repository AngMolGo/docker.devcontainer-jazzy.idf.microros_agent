#!/bin/bash
set -e  # Detener el script si ocurre un error

. /opt/ros/$ROS_DISTRO/setup.bash 

mkdir -p /root/microros_agent_ws
cd /root/microros_agent_ws

git clone -b $ROS_DISTRO https://github.com/micro-ROS/micro_ros_setup.git src/micro_ros_setup
apt-get update && rosdep update
rosdep install --from-paths src --ignore-src -y

# Install pip
apt-get install python3-pip -y && rm -rf /var/lib/apt/lists/*

# Build micro-ROS tools and source them
colcon build
source ./install/local_setup.bash
ros2 run micro_ros_setup create_agent_ws.sh
ros2 run micro_ros_setup build_agent.sh