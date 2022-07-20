#!/usr/bin/python3
#coding=utf8
import os
import sys
import rospy
from sensor.msg import *
from std_msgs.msg import *

# 控制RGB彩灯

print('''
**********************************************************
****************功能:RGB彩灯控制例程************************
**********************************************************
----------------------------------------------------------
Official website:https://www.hiwonder.com
Online mall:https://hiwonder.tmall.com
----------------------------------------------------------
Tips:
 * 按下Ctrl+C可关闭此次程序运行，若失败请多次尝试！
----------------------------------------------------------
''')

# 关闭RGB彩灯
def turn_off_rgb():
    led = Led()
    led.rgb.r = 0
    led.rgb.g = 0
    led.rgb.b = 0
    led.index = 0
    rgb_pub.publish(led)
    rospy.sleep(0.01)
    led.index = 1
    rgb_pub.publish(led)

# 设置RGB彩灯显示
def set_rgb_show(r,g,b):
    led = Led()
    led.rgb.r = r
    led.rgb.g = g
    led.rgb.b = b
    led.index = 0
    rgb_pub.publish(led)
    rospy.sleep(0.01)
    led.index = 1
    rgb_pub.publish(led)

# 关闭检测函数
run_st = True
def Stop():
    global run_st
    run_st = False
    turn_off_rgb()
    print('关闭中...')


if __name__ == '__main__':
    # 初始化节点    
    rospy.init_node('rgb_control_demo')
    rospy.on_shutdown(Stop)
    # RGB彩灯节点,源码路径:/home/pi/puppy_pi/src/sensor/scripts/sensor_control.py
    rgb_pub = rospy.Publisher('/sensor/rgb_led', Led, queue_size=1)
    rospy.sleep(0.2) # 延时一会，等待订阅生效
    
    while run_st:
        r,g,b = 0,0,0
        for r in range(0,255,5): #红色渐亮
            set_rgb_show(r,g,b)
            rospy.sleep(0.005)
            
        rospy.sleep(1)
        r,g,b = 0,0,0 
        for g in range(0,255,5): #绿色渐亮
            set_rgb_show(r,g,b)
            rospy.sleep(0.005)
        
        rospy.sleep(1)
        r,g,b = 0,0,0 
        for b in range(0,255,5): #蓝色渐亮
            set_rgb_show(r,g,b)
            rospy.sleep(0.005)
        rospy.sleep(1)
        
        
    
