#!/usr/bin/python3
#coding=utf8
import os
import sys
import rospy
import ASR as ASR
from sensor.msg import *
from std_msgs.msg import *

print('''
**********************************************************
*******************功能:语音识别例程************************
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
    # 语音识别模块初始化
    asr = ASR.ASR()
    asr.getResult()
    asr.eraseWords()
    #1：循环识别模式。状态灯常亮（默认模式）    
    #2：口令模式，以第一个词条为口令。状态灯常灭，当识别到口令词时常亮，等待识别到新的语音,并且读取识别结果后即灭掉
    #3：按键模式，按下开始识别，不按不识别。支持掉电保存。状态灯随按键按下而亮起，不按不亮
    asr.setMode(2)
    #添加的词条
    asr.addWords(1, 'pa pi pai')
    asr.addWords(2, 'hong se')
    asr.addWords(3, 'lu se')
    asr.addWords(4, 'lan se')
    
    # 初始化节点    
    rospy.init_node('ASR_detect_demo')
    rospy.on_shutdown(Stop)
    # RGB彩灯节点,源码路径:/home/pi/puppy_pi/src/sensor/scripts/sensor_control.py
    rgb_pub = rospy.Publisher('/sensor/rgb_led', Led, queue_size=1)
    rospy.sleep(0.2) # 延时一会，等待订阅生效
    
    while run_st:
        data = asr.getResult()
        if data:
            print("result:", data)
            if data == 2:
                set_rgb_show(255,0,0) #红色
                rospy.sleep(0.1)
                
            if data == 3:
                set_rgb_show(0,255,0) #绿色
                rospy.sleep(0.1)
                
            if data == 4:
                set_rgb_show(0,0,255) #蓝色
                rospy.sleep(0.1)
                
        elif data is None:
            print('Sensor not connected!')
            break
            
            
        
        
    
