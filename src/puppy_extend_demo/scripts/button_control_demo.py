#!/usr/bin/python3
#coding=utf8
import os
import sys
import rospy
import pigpio
from sensor.msg import *
from std_msgs.msg import *

# 按键控制

print('''
**********************************************************
*********************功能:按键控制例程**********************
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
    # 按键初始化配置
    key1_pin = 25
    key2_pin = 23
    pi = pigpio.pi()
    pi.set_mode(key1_pin, pigpio.INPUT)
    pi.set_mode(key2_pin, pigpio.INPUT)
    pi.set_pull_up_down(key1_pin, pigpio.PUD_UP)
    pi.set_pull_up_down(key2_pin, pigpio.PUD_UP)
    
    # 初始化节点    
    rospy.init_node('button_control_demo')
    rospy.on_shutdown(Stop)
    # RGB彩灯节点,源码路径:/home/pi/puppy_pi/src/sensor/scripts/sensor_control.py
    rgb_pub = rospy.Publisher('/sensor/rgb_led', Led, queue_size=1)
    # 蜂鸣器节点,源码路径:/home/pi/puppy_pi/src/sensor/scripts/sensor_control.py
    buzzer_pub = rospy.Publisher("/sensor/buzzer", Float32, queue_size=1)
    rospy.sleep(0.5) # 延时一会
    
    button_press = False # 按键按压状态
    while run_st:
        if pi.read(key1_pin) == 0: # 检测到按键1按下
            rospy.sleep(0.05) # 延时消抖再检测
            if pi.read(key1_pin) == 0:
                if not button_press:
                    button_press = True
                    r,g,b = 0,255,0
                    set_rgb_show(r,g,b) #绿色
                    buzzer_pub.publish(0.5) # 蜂鸣器响0.5秒
        
        if pi.read(key2_pin) == 0: # 检测到按键2按下
            rospy.sleep(0.05) # 延时消抖再检测
            if pi.read(key2_pin) == 0:
                if not button_press:
                    button_press = True
                    r,g,b = 0,0,255
                    set_rgb_show(r,g,b) #蓝色
                    buzzer_pub.publish(0.5) # 蜂鸣器响0.5秒
        else:
            if button_press:
                button_press = False
            rospy.sleep(0.05)
        
    
