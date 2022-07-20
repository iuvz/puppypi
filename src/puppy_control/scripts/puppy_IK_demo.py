#!/usr/bin/python3
# coding=utf8
# Author:hiwonder

import os, sys, time
import numpy as np


HomePath = '/home/pi'
sys.path.append(HomePath + '/PuppyPi_PC_Software')
from ServoCmd import setServoPulse
from HiwonderPuppy import HiwonderPuppy, PWMServoParams


puppy = HiwonderPuppy(setServoPulse = setServoPulse, servoParams = PWMServoParams(), dof = '8')
                            # FR    FL    BR     BL
foot_locations = np.array([ [ -1.,  -1.,  -1.,   -1.], # X
                            [ 0.,    0.,   0.,    0.], # Y
                            [-10,   -10,  -10,   -10,] # Z
                            ])
# 相对4条腿各自坐标系的坐标值，单位cm


foot_locations = foot_locations/100 # 换算成以米为单位

joint_angles = puppy.fourLegsRelativeCoordControl(foot_locations)
# 输入坐标，通过逆运动学计算得到各个舵机的角度值
print(joint_angles*57.3)

puppy.servo_force_run()
# 强制执行舵机角度转动，没有这句舵机有时候不会转动

puppy.sendServoAngle(joint_angles, time = 500)
#将舵机角度发送到舵机，


while True:
    time.sleep(0.001)