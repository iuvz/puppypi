#!/usr/bin/python3
#coding=utf8
import os
import sys
import math
import rospy
import RPi.GPIO as GPIO
from sensor.msg import *
from std_msgs.msg import *


print('''
**********************************************************
*******************功能:触摸检测例程************************
**********************************************************
----------------------------------------------------------
Official website:https://www.hiwonder.com
Online mall:https://hiwonder.tmall.com
----------------------------------------------------------
Tips:
 * 按下Ctrl+C可关闭此次程序运行，若失败请多次尝试！
----------------------------------------------------------
''')

# 触摸模块接扩展板上的IO22、IO24接口

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)

# 关闭检测函数
run_st = True
def Stop():
    global run_st
    run_st = False
    print('关闭中...')
    buzzer_pub.publish(0)

if __name__ == '__main__':
    # 初始化节点    
    rospy.init_node('buzzer_control_demo')
    rospy.on_shutdown(Stop)
    # 蜂鸣器节点,源码路径:/home/pi/puppy_pi/src/sensor/scripts/sensor_control.py
    buzzer_pub = rospy.Publisher("/sensor/buzzer", Float32, queue_size=1)
    rospy.sleep(0.5) # 延时一会
    
    GPIO.setup(22, GPIO.IN) #设置引脚为输入模式
    st = 0
    while run_st:
        state = GPIO.input(22)  #读取引脚数字值
        if not state:
            if st :             #这里做一个判断，防止反复响
                st = 0
                buzzer_pub.publish(0.5) # 蜂鸣器响0.5秒
                rospy.sleep(1)
        else:
            st = 1
            
        
    
