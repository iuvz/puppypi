#!/usr/bin/env python3
import os
import sys
import math
import rospy
import Sonar as Sonar
from puppy_control.msg import Velocity, Pose, Gait

print('''
**********************************************************
********************功能:超声波避障例程**********************
**********************************************************
----------------------------------------------------------
Official website:https://www.hiwonder.com
Online mall:https://hiwonder.tmall.com
----------------------------------------------------------
Tips:
 * 按下Ctrl+C可关闭此次程序运行，若失败请多次尝试！
----------------------------------------------------------
''')

if sys.version_info.major == 2:
    print('Please run this program with python3!')
    sys.exit(0)

PuppyPose = {'roll':math.radians(0), 'pitch':math.radians(0), 'yaw':0.000, 'height':-10, 'x_shift':-0.5, 'stance_x':0, 'stance_y':0}
# stance_x：4条腿在x轴上额外分开的距离，单位cm
# stance_y：4条腿在y轴上额外分开的距离，单位cm
# x_shift: 4条腿在x轴上同向移动的距离，越小，走路越前倾，越大越后仰,通过调节x_shift可以调节小狗走路的平衡，单位cm
# height： 狗的高度，脚尖到大腿转动轴的垂直距离，单位cm
# pitch： 狗身体的俯仰角，单位弧度


GaitConfig = {'overlap_time':0.15, 'swing_time':0.2, 'clearance_time':0.0, 'z_clearance':3}
# overlap_time:4脚全部着地的时间，单位秒
# swing_time：2脚离地时间，单位秒
# clearance_time：前后脚间隔时间，单位秒
# z_clearance：走路时，脚抬高的距离，单位cm

# 关闭检测函数
run_st = True
def Stop():
    global run_st
    run_st = False
    PuppyVelocityPub.publish(x=0, y=0, yaw_rate=0)
    print('关闭中...')
    

if __name__ == '__main__':
    s = Sonar.Sonar()
    s.setRGBMode(0) # 0:彩灯模块,1:呼吸灯模式
    s.setRGB(1, (0, 0, 0)) # 关闭RGB灯
    s.setRGB(0, (0, 0, 0))
    
    # 初始化节点    
    rospy.init_node('Sonar_avoidance')
    rospy.on_shutdown(Stop)
    # 订阅puppy_control节点，源码路径：/home/pi/puppy_pi/src/puppy_control/scripts/puppy.py
    PuppyPosePub = rospy.Publisher('/puppy_control/pose', Pose, queue_size=1)
    PuppyGaitConfigPub = rospy.Publisher('/puppy_control/gait', Gait, queue_size=1)
    PuppyVelocityPub = rospy.Publisher('/puppy_control/velocity', Velocity, queue_size=1)
    rospy.sleep(0.2)
    PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift']
            ,height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 500)
    
    rospy.sleep(0.2)
    PuppyGaitConfigPub.publish(overlap_time = GaitConfig['overlap_time'], swing_time = GaitConfig['swing_time']
                    , clearance_time = GaitConfig['clearance_time'], z_clearance = GaitConfig['z_clearance'])
    
    forward = True
    
    while run_st:
        rospy.sleep(0.1)
        distance = s.getDistance() # 获得检测的距离
        print('distance: {}(mm)'.format(distance))
        if distance <= 300: # 距离小于300mm
            if not forward:
                forward = True
                s.setRGB(1, (255, 0, 0)) # 设为红色
                s.setRGB(0, (255, 0, 0))
                PuppyVelocityPub.publish(x=5, y=0, yaw_rate=0.3) # 左转
                rospy.sleep(6)
            
        else:
            if forward:
                forward = False
                s.setRGB(1, (0, 0, 255)) # 设为蓝色
                s.setRGB(0, (0, 0, 255))
                PuppyVelocityPub.publish(x=15, y=0, yaw_rate=0) # 前进
            
    s.setRGB(1, (0, 0, 0))
    s.setRGB(0, (0, 0, 0))
