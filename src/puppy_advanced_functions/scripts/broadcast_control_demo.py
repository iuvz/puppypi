#!/usr/bin/python3
# coding=utf8
# Date:2022/05/16
# Author:hiwonder
import os
import time
import math
import rospy
import roslibpy
import device_scan

'''

'''

device_client = []
topics = []
def init():
    global device_client
    global topics

    device_client = []
    topics = []

    device_lists = device_scan.scan_device_all('PUPPY')

    for device in device_lists:
        cpu_serial, ip = device[1], device[2]
        print('d', cpu_serial, ip)
        device_client.append(roslibpy.Ros(host=str(ip), port=9090))
    
    for client in device_client:
        client.run()
        topic1 = roslibpy.Topic(client, '/performance/set_target', 'std_msgs/String')
        topics.extend(([[client, topic1]]))



try:
    rospy.init_node('broadcast_control_demo')
    init()
    rospy.loginfo('connect success')
    for topic in topics:
        topic[1].publish(roslibpy.Message({'data': 'multiaxial'})) # 多轴联动
        
    time.sleep(1)
except BaseException as e:
    print(e)
    rospy.loginfo('connect failed')
