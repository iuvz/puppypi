#!/usr/bin/env python3
# coding=utf8
import os
import sys
import math
import rospy
import MP3 as MP3
from sensor.msg import *
from std_msgs.msg import *
from puppy_control.srv import SetRunActionName
from puppy_control.msg import Velocity, Pose, Gait

print('''
**********************************************************
******************功能:MP3模块例程*************************
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


GaitConfig = {'overlap_time':0.3, 'swing_time':0.2, 'clearance_time':0.0, 'z_clearance':5}
# overlap_time:4脚全部着地的时间，单位秒
# swing_time：2脚离地时间，单位秒
# clearance_time：前后脚间隔时间，单位秒
# z_clearance：走路时，脚抬高的距离，单位cm

# 多轴联动
def linkage(times =1):
    # times:循环次数
    for i in range(0,15,1):
        PuppyPose = {'roll':math.radians(i), 'pitch':math.radians(0), 'yaw':0.000, 'height':-10, 'x_shift':-0.5, 'stance_x':0, 'stance_y':0}
        PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift'],
            height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 30)
        rospy.sleep(0.03)
    for i in range(0,15,1):
        PuppyPose = {'roll':math.radians(15), 'pitch':math.radians(i), 'yaw':0.000, 'height':-10, 'x_shift':-0.5, 'stance_x':0, 'stance_y':0}
        PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift'],
            height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 30)
        rospy.sleep(0.03)
        
    for s in range(times):
        for i in range(15,-15,-1):
            PuppyPose = {'roll':math.radians(i), 'pitch':math.radians(15), 'yaw':0.000, 'height':-10, 'x_shift':-0.5, 'stance_x':0, 'stance_y':0}
            PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift'],
                height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 30)
            rospy.sleep(0.03)
        for i in range(15,-15,-1):
            PuppyPose = {'roll':math.radians(-15), 'pitch':math.radians(i), 'yaw':0.000, 'height':-10, 'x_shift':-0.5, 'stance_x':0, 'stance_y':0}
            PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift'],
                height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 30)
            rospy.sleep(0.03)
             
        for i in range(-15,15,1):
            PuppyPose = {'roll':math.radians(i), 'pitch':math.radians(-15), 'yaw':0.000, 'height':-10, 'x_shift':-0.5, 'stance_x':0, 'stance_y':0}
            PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift'],
                height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 30)
            rospy.sleep(0.03)
        for i in range(-15,15,1):
            PuppyPose = {'roll':math.radians(15), 'pitch':math.radians(i), 'yaw':0.000, 'height':-10, 'x_shift':-0.5, 'stance_x':0, 'stance_y':0}
            PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift'],
                height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 30)
            rospy.sleep(0.03)
            

# 关闭检测函数
run_st = True
def Stop():
    global run_st
    run_st = False
    print('关闭中...')
    mp3.pause()
    runActionGroup_srv('stand.d6ac',True)
    PuppyVelocityPub.publish(x=0, y=0, yaw_rate=0)
    
            
if __name__ == "__main__":
    addr = 0x7b #传感器iic地址
    mp3 = MP3.MP3(addr)
    mp3.volume(30) #设置音量为20，注意在播放前设置
    mp3.playNum(25) #播放歌曲3
    
    # 初始化节点    
    rospy.init_node('mp3_moonwalk_demo')
    rospy.on_shutdown(Stop)
    # 订阅puppy_control节点，源码路径：/home/pi/puppy_pi/src/puppy_control/scripts/puppy.py
    PuppyPosePub = rospy.Publisher('/puppy_control/pose', Pose, queue_size=1)
    PuppyGaitConfigPub = rospy.Publisher('/puppy_control/gait', Gait, queue_size=1)
    PuppyVelocityPub = rospy.Publisher('/puppy_control/velocity', Velocity, queue_size=1)
    runActionGroup_srv = rospy.ServiceProxy('/puppy_control/runActionGroup', SetRunActionName)
    rospy.sleep(0.3) # 延时一会
    # 机器狗站立
    PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift'],
        height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 500)
    
    rospy.sleep(0.5)
    PuppyGaitConfigPub.publish(overlap_time = GaitConfig['overlap_time'], swing_time = GaitConfig['swing_time']
                    , clearance_time = GaitConfig['clearance_time'], z_clearance = GaitConfig['z_clearance'])
    
    # 原地踏步
    PuppyVelocityPub.publish(x=0.01, y=0, yaw_rate=0) 
    rospy.sleep(3)
    PuppyVelocityPub.publish(x=0, y=0, yaw_rate=0)
    rospy.sleep(1)
    
    # 多轴联动
    linkage(2) 
    # 机器狗站立
    PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift'],
        height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 500)
    rospy.sleep(0.5)
    
    # 向前走
    PuppyVelocityPub.publish(x=5, y=0, yaw_rate=0) 
    rospy.sleep(3)
    
    PuppyVelocityPub.publish(x=-5, y=0, yaw_rate=0) 
    rospy.sleep(2)
    # 向后走
    PuppyVelocityPub.publish(x=0, y=0, yaw_rate=0)
    rospy.sleep(1)
    
    # 执行滑步动作组
    runActionGroup_srv('moonwalk.d6ac',True)
    runActionGroup_srv('moonwalk.d6ac',True)
    rospy.sleep(0.5)
    
    # 机器狗站立
    PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift']
            ,height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 500)
    rospy.sleep(0.5)
    # 向前走
    PuppyVelocityPub.publish(x=5, y=0, yaw_rate=0) 
    rospy.sleep(5)
    # 原地踏步
    PuppyVelocityPub.publish(x=0.01, y=0, yaw_rate=0) 
    rospy.sleep(3)
    PuppyVelocityPub.publish(x=0, y=0, yaw_rate=0)
    rospy.sleep(1)
    
    
    
            