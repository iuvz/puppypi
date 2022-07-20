#!/usr/bin/python3
#coding=utf8
import os
import sys
import time
import math
import rospy
import RPi.GPIO as GPIO
from sensor.msg import *
from std_msgs.msg import *
from puppy_control.msg import Velocity, Pose, Gait

print('''
**********************************************************
******************功能:触摸控制例程*************************
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

PuppyPose = {'roll':math.radians(0), 'pitch':math.radians(0), 'yaw':0.000, 'height':-10, 'x_shift':-0.5, 'stance_x':0, 'stance_y':0}
# stance_x：4条腿在x轴上额外分开的距离，单位cm
# stance_y：4条腿在y轴上额外分开的距离，单位cm
# x_shift: 4条腿在x轴上同向移动的距离，越小，走路越前倾，越大越后仰,通过调节x_shift可以调节小狗走路的平衡，单位cm
# height： 狗的高度，脚尖到大腿转动轴的垂直距离，单位cm
# pitch： 狗身体的俯仰角，单位弧度


GaitConfig = {'overlap_time':0.2, 'swing_time':0.2, 'clearance_time':0.0, 'z_clearance':3}
# overlap_time:4脚全部着地的时间，单位秒
# swing_time：2脚离地时间，单位秒
# clearance_time：前后脚间隔时间，单位秒
# z_clearance：走路时，脚抬高的距离，单位cm

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)

# 关闭检测函数
run_st = True
def Stop():
    global run_st
    run_st = False
    print('关闭中...')


if __name__ == '__main__':
    # 初始化节点    
    rospy.init_node('touch_control_demo')
    rospy.on_shutdown(Stop)
    # 订阅puppy_control节点，源码路径：/home/pi/puppy_pi/src/puppy_control/scripts/puppy.py
    PuppyPosePub = rospy.Publisher('/puppy_control/pose', Pose, queue_size=1)
    PuppyGaitConfigPub = rospy.Publisher('/puppy_control/gait', Gait, queue_size=1)
    PuppyVelocityPub = rospy.Publisher('/puppy_control/velocity', Velocity, queue_size=1)
    rospy.sleep(0.5) # 延时一会
    # 机器狗站立
    PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift']
            ,height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 500)
    
    rospy.sleep(0.2)
    PuppyGaitConfigPub.publish(overlap_time = GaitConfig['overlap_time'], swing_time = GaitConfig['swing_time']
                    , clearance_time = GaitConfig['clearance_time'], z_clearance = GaitConfig['z_clearance'])
    
    GPIO.setup(22, GPIO.IN) #设置引脚为输入模式
    click = 0
    squat = True
    while run_st:
        state = GPIO.input(22)  #读取引脚数字值
        rospy.sleep(0.05)
        if not state:
            detect_time = time.time()+1
            while time.time() < detect_time:
                state = GPIO.input(22)  #读取引脚数字值
                rospy.sleep(0.1)
                if not state:
                    click += 1
                    rospy.sleep(0.1)
            
            if click == 1:
                click = 0
                if squat:
                    # 机器狗下蹲 
                    PuppyPose = {'roll':math.radians(0), 'pitch':math.radians(0), 'yaw':0.000, 'height':-6, 'x_shift':-0.5, 'stance_x':0, 'stance_y':0}
                    PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift'],
                            height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 500)
                    rospy.sleep(1)
                    squat = False
                    
                elif not squat:
                    # 机器狗站立
                    PuppyPose = {'roll':math.radians(0), 'pitch':math.radians(0), 'yaw':0.000, 'height':-10, 'x_shift':-0.5, 'stance_x':0, 'stance_y':0}
                    PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift'],
                            height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 500)
                    rospy.sleep(1)
                    squat = True
                    
            elif click == 2:
                click = 0
                # 机器人抖一抖
                for i in range(5):
                    PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift'],
                        height=PuppyPose['height'], roll=math.radians(3.5), pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 50)
                    rospy.sleep(0.13)
                    PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift'],
                        height=PuppyPose['height'], roll=math.radians(-3.5), pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 50)
                    rospy.sleep(0.13)
                
                PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift'],
                    height=PuppyPose['height'], roll=math.radians(0), pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 300)
                rospy.sleep(1)
       
        
    
