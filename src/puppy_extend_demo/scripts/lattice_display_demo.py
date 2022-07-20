#!/usr/bin/env python3
import os
import sys
import time
import tm1640 as tm

if sys.version_info.major == 2:
    print('Please run this program with python3!')
    sys.exit(0)

print('''
**********************************************************
********************功能:点阵显示实验例程********************
**********************************************************
----------------------------------------------------------
Official website:https://www.hiwonder.com
Online mall:https://hiwonder.tmall.com
----------------------------------------------------------
Tips:
 * 按下Ctrl+C可关闭此次程序运行，若失败请多次尝试！
----------------------------------------------------------
''')

# 点阵模块接扩展板上的IO7、IO8接口


if __name__ == '__main__':
    # 显示'Hello'
    tm.display_buf = (0x7f, 0x08, 0x7f, 0x00, 0x7c, 0x54, 0x5c, 0x00,
                       0x7f, 0x40, 0x00,0x7f, 0x40, 0x38, 0x44, 0x38)
    tm.update_display() # 更新显示

    time.sleep(5) # 延时
    
    tm.display_buf = [0] * 16 # 缓存置零
    tm.update_display() # 更新显示
