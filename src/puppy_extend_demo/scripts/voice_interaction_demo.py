#!/usr/bin/env python3
# coding=utf8
import os
import sys
import math
import rospy
import ASR as ASR
from sensor.msg import *
from std_msgs.msg import *
from puppy_control.msg import Velocity, Pose, Gait

print('''
**********************************************************
******************功能:语音交互例程*************************
**********************************************************
----------------------------------------------------------
Official website:https://www.hiwonder.com
Online mall:https://hiwonder.tmall.com
----------------------------------------------------------
Tips:
 * 按下Ctrl+C可关闭此次程序运行，若失败请多次尝试！
----------------------------------------------------------
''')

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

# 关闭检测函数
run_st = True
def Stop():
    global run_st
    run_st = False
    print('关闭中...')

if __name__ == "__main__":
    # 语音识别模块初始化
    asr = ASR.ASR()
    asr.getResult()
    asr.eraseWords()
    #1：循环识别模式。状态灯常亮（默认模式）    
    #2：口令模式，以第一个词条为口令。状态灯常灭，当识别到口令词时常亮，等待识别到新的语音,并且读取识别结果后即灭掉
    #3：按键模式，按下开始识别，不按不识别。支持掉电保存。状态灯随按键按下而亮起，不按不亮
    asr.setMode(2)
    #添加的词条
    asr.addWords(1, 'kai shi')
    asr.addWords(2, 'tai tou')
    asr.addWords(3, 'pa xia')
    asr.addWords(4, 'li zheng')
    asr.addWords(5, 'yuan di ta bu')
    
    # 初始化节点    
    rospy.init_node('voice_interaction_demo')
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
     
    while run_st:
        data = asr.getResult()
        if data:
            print("result:", data)
            if data == 2: # 抬头
                PuppyPose = {'roll':math.radians(0), 'pitch':math.radians(20), 'yaw':0.000, 'height':-10, 'x_shift':-0.5, 'stance_x':0, 'stance_y':0}
                PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift']
                    ,height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 500)
                
            elif data == 3: # 趴下
                PuppyPose = {'roll':math.radians(0), 'pitch':math.radians(0), 'yaw':0.000, 'height':-6, 'x_shift':-0.5, 'stance_x':0, 'stance_y':0}
                PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift']
                    ,height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 500)
                
            elif data == 4: # 立正
                PuppyPose = {'roll':math.radians(0), 'pitch':math.radians(0), 'yaw':0.000, 'height':-10, 'x_shift':-0.5, 'stance_x':0, 'stance_y':0}
                PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift']
                    ,height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 500)
                
            elif data == 5: # 原地踏步
                PuppyPose = {'roll':math.radians(0), 'pitch':math.radians(0), 'yaw':0.000, 'height':-10, 'x_shift':-0.5, 'stance_x':0, 'stance_y':0}
                PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift']
                    ,height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 500)
                rospy.sleep(0.5)
                PuppyVelocityPub.publish(x=0.1, y=0, yaw_rate=0)
                rospy.sleep(2)
                PuppyVelocityPub.publish(x=0, y=0, yaw_rate=0)
                
        elif data is None:
            print('Sensor not connected!')
            break
