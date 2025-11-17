#!/bin/bash

apt-get update -y && apt-get install ros-${ROS_DISTRO}-ur -y && rm -rf /var/lib/apt/lists/*