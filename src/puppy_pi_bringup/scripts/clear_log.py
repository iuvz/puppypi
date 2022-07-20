#!/usr/bin/python3 
import os
import sys
import time
import signal

# 每30分钟检测一次日志文件，如果大于10m，则清空
# 过大的日志文件会导致cpu占用过高，运行异常
# 关闭此功能，重启生效：sudo systemctl disable clear_log.service

running = True
def handler(signum, frame):
    global running

    running = False
    print('exit')
    sys.exit(0)

signal.signal(signal.SIGINT, handler)

ros_log_path = '/home/pi/.ros/log'

log_size = 0
while running:
    try:
        for root, dirs, files in os.walk(ros_log_path):
            for f in files:
                log_size += os.path.getsize(os.path.join(root, f))
        log_size /= float(1024*1024)
        #print('当前日志大小:{}m'.format(log_size))
        if log_size > 5:
            os.system('sudo rm -rf {}/*'.format(ros_log_path))
        time.sleep(30*60)
    except BaseException as e:
        print(e)
