#!/usr/bin/python3
#coding=utf8
import os
import sys
import rospy
from sensor.msg import *
from std_msgs.msg import *

# 控制蜂鸣器

print('''
**********************************************************
******************功能:蜂鸣器控制例程***********************
**********************************************************
----------------------------------------------------------
Official website:https://www.hiwonder.com
Online mall:https://hiwonder.tmall.com
----------------------------------------------------------
Tips:
 * 按下Ctrl+C可关闭此次程序运行，若失败请多次尝试！
----------------------------------------------------------
''')

if __name__ == '__main__':
    # 初始化节点    
    rospy.init_node('buzzer_control_demo')
    # 蜂鸣器节点,源码路径:/home/pi/puppy_pi/src/sensor/scripts/sensor_control.py
    buzzer_pub = rospy.Publisher("/sensor/buzzer", Float32, queue_size=1)
    rospy.sleep(0.5) # 延时一会
    
    buzzer_pub.publish(2) # 蜂鸣器响2秒
    rospy.sleep(1)
    buzzer_pub.publish(0.5) # 蜂鸣器响0.5秒      
        
    
