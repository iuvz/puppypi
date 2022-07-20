#!/usr/bin/env python3
import os
import sys
import time
import signal
import Sonar as Sonar

print('''
**********************************************************
*******************功能:超声波控制例程**********************
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


# 关闭检测函数
run_st = True
def Stop(signum, frame):
    global run_st
    run_st = False
    print('关闭中...')

signal.signal(signal.SIGINT, Stop)

if __name__ == '__main__':
    s = Sonar.Sonar()
    s.setRGBMode(0) # 0:彩灯模块,1:呼吸灯模式
    s.setRGB(1, (0, 0, 0)) # 关闭RGB灯
    s.setRGB(0, (0, 0, 0))
    while run_st:
        time.sleep(0.1)
        distance = s.getDistance() # 获得检测的距离
        print('distance: {}(mm)'.format(distance))
        if distance <= 300: # 距离小于300mm
            s.setRGB(1, (255, 0, 0)) # 设为红色
            s.setRGB(0, (255, 0, 0))
            
        elif 300 < distance < 500: 
            s.setRGB(1, (0, 255, 0)) # 设为绿色
            s.setRGB(0, (0, 255, 0))
            
        else:
            s.setRGB(1, (0, 0, 255)) # 设为蓝色
            s.setRGB(0, (0, 0, 255))
            
    s.setRGB(1, (0, 0, 0))
    s.setRGB(0, (0, 0, 0))
    
