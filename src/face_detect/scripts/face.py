#!/usr/bin/python3
# coding=utf8
# Date:2021/09/27
# Author:hiwonder
import sys
import cv2
import math
import rospy
import threading
import numpy as np
from threading import RLock, Timer

from std_srvs.srv import *
from sensor_msgs.msg import Image

from puppy_control.srv import SetRunActionName

# from hiwonder_servo_msgs.msg import MultiRawIdPosDur

# from kinematics import ik_transform

# from armpi_fpv import Misc
# from armpi_fpv import bus_servo_control

# 阈值
conf_threshold = 0.6

# 模型位置
modelFile = "/home/pi/puppy_pi/src/face_detect/scripts/models/res10_300x300_ssd_iter_140000_fp16.caffemodel"
configFile = "/home/pi/puppy_pi/src/face_detect/scripts/models/deploy.prototxt"
net = cv2.dnn.readNetFromCaffe(configFile, modelFile)

# ik = ik_transform.ArmIK()
__isRunning = False

org_image_sub_ed = False
lock = RLock()






range_rgb = {
    'red': (0, 0, 255),
    'blue': (255, 0, 0),
    'green': (0, 255, 0),
    'black': (0, 0, 0),
    'white': (255, 255, 255),
}

# 初始位置
def initMove(delay=False):
    runActionGroup_srv('sit.d6ac',False)
    with lock:
        pass
    if delay:
        rospy.sleep(2)

d_pulse = 5
have_move = False
servo6_pulse = 500
start_greet = False
action_finish = True
# 变量重置
def reset():
    global d_pulse
    global have_move       
    global start_greet
    global servo6_pulse
    global action_finish 

    with lock:
        d_pulse = 5
        have_move = False
        servo6_pulse = 500
        start_greet = False

# app初始化调用
def init():
    print("face detect Init")
    initMove()
    reset()

def move():
    global have_move
    global start_greet
    global action_finish 
    global d_pulse, servo6_pulse 
        
    while True:
        if __isRunning:
            if start_greet:
                start_greet = False                
                action_finish = False

                runActionGroup_srv('shake_hands.d6ac',True)
                action_finish = True
                have_move = True
            else:
                if have_move:
                    have_move = False
                    rospy.sleep(0.2)

                rospy.sleep(0.05)                
        else:
            rospy.sleep(0.01)
            
# 运行子线程
th = threading.Thread(target=move)
th.setDaemon(True)
th.start()

frame_pass = True
def run(img):
    global frame_pass
    global start_greet

    img_copy = img.copy()
    img_h, img_w = img.shape[:2]
    
    if frame_pass:
        frame_pass = False
        return img
    
    frame_pass = True

    blob = cv2.dnn.blobFromImage(img_copy, 1, (150, 150), [104, 117, 123], False, False)
    net.setInput(blob)
    detections = net.forward() #计算识别
    for i in range(detections.shape[2]):
        confidence = detections[0, 0, i, 2]
        if confidence > conf_threshold:
            #识别到的人了的各个坐标转换会未缩放前的坐标
            x1 = int(detections[0, 0, i, 3] * img_w)
            y1 = int(detections[0, 0, i, 4] * img_h)
            x2 = int(detections[0, 0, i, 5] * img_w)
            y2 = int(detections[0, 0, i, 6] * img_h)             
            cv2.rectangle(img, (x1, y1), (x2, y2), (0, 255, 0), 2, 8) #将识别到的人脸框出
            center_x = int((x1 + x2)/2)
            if action_finish and abs(center_x - img_w/2) < 100:
                start_greet = True       
    return img

def image_callback(ros_image):
    global lock
    
    image = np.ndarray(shape=(ros_image.height, ros_image.width, 3), dtype=np.uint8,
                       buffer=ros_image.data)  # 将自定义图像消息转化为图像
    cv2_img = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
    
    frame = cv2_img.copy()
    frame_result = frame
    with lock:
        if __isRunning:
            frame_result = run(frame)
    rgb_image = cv2.cvtColor(frame_result, cv2.COLOR_BGR2RGB).tobytes()
    ros_image.data = rgb_image
    image_pub.publish(ros_image)

def enter_func(msg):
    global lock
    global image_sub
    global __isRunning
    global org_image_sub_ed

    rospy.loginfo("enter face detect")
    with lock:
        init()
        if not org_image_sub_ed:
            org_image_sub_ed = True
            image_sub = rospy.Subscriber('/usb_cam/image_raw', Image, image_callback)
            
    return [True, 'enter']

heartbeat_timer = None
def exit_func(msg):
    global lock
    global image_sub
    global __isRunning
    global org_image_sub_ed
    
    rospy.loginfo("exit face detect")
    with lock:
        __isRunning = False
        try:
            if org_image_sub_ed:
                org_image_sub_ed = False
                if heartbeat_timer:heartbeat_timer.cancel()
                image_sub.unregister()
        except:
            pass
    
    return [True, 'exit']

def start_running():
    global lock
    global __isRunning

    rospy.loginfo("start running face detect")
    with lock:
        __isRunning = True

def stop_running():
    global lock
    global __isRunning

    rospy.loginfo("stop running face detect")
    with lock:
        __isRunning = False
        reset()
        initMove(delay=False)

def set_running(msg):
    if msg.data:
        start_running()
    else:
        stop_running()
    
    return [True, 'set_running']

def heartbeat_srv_cb(msg):
    global heartbeat_timer
    
    if isinstance(heartbeat_timer, Timer):
        heartbeat_timer.cancel()
    if msg.data:
        heartbeat_timer = Timer(5, rospy.ServiceProxy('/face_detect/exit', Trigger))
        heartbeat_timer.start()
    rsp = SetBoolResponse()
    rsp.success = msg.data

    return rsp

if __name__ == '__main__':
    rospy.init_node('face_detect', log_level=rospy.DEBUG)
    
    # joints_pub = rospy.Publisher('/servo_controllers/port_id_1/multi_id_pos_dur', MultiRawIdPosDur, queue_size=1)

    image_pub = rospy.Publisher('/face_detect/image_result', Image, queue_size=1)  # register result image publisher

    enter_srv = rospy.Service('/face_detect/enter', Trigger, enter_func)
    exit_srv = rospy.Service('/face_detect/exit', Trigger, exit_func)
    running_srv = rospy.Service('/face_detect/set_running', SetBool, set_running)
    heartbeat_srv = rospy.Service('/face_detect/heartbeat', SetBool, heartbeat_srv_cb)
    runActionGroup_srv = rospy.ServiceProxy('/puppy_control/runActionGroup', SetRunActionName)

    debug = False
    if debug:
        enter_func(1)
        start_running()
    
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    finally:
        cv2.destroyAllWindows()
