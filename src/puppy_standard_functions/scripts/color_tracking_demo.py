#!/usr/bin/python3
# coding=utf8
# Date:2021/12/02
# Author:Hiwonder
import sys
import cv2
import math
import rospy
import numpy as np
from threading import RLock, Timer

from std_srvs.srv import *
from sensor_msgs.msg import Image

from sensor.msg import Led
from object_tracking.srv import *
from puppy_control.msg import Velocity, Pose

from puppy_pi import PID
from puppy_pi import Misc

from puppy_control.srv import SetRunActionName

ROS_NODE_NAME = 'color_tracking_demo'


PuppyPose = {}
PuppyMove = {'x':0, 'y':0, 'yaw_rate':0}


size = (320, 240)
start_move = True
__target_color = ''
__isRunning = False
org_image_sub_ed = False

x_dis = 500
y_dis = 0.167
Z_DIS = 0.2
z_dis = Z_DIS
x_pid = PID.PID(P=0.06, I=0.005, D=0)  # pid初始化
y_pid = PID.PID(P=0.00001, I=0, D=0)
z_pid = PID.PID(P=0.003, I=0, D=0)

range_rgb = {
    'red': (0, 0, 255),
    'blue': (255, 0, 0),
    'green': (0, 255, 0),
    'black': (0, 0, 0),
    'white': (255, 255, 255),
}

lock = RLock()

# 找出面积最大的轮廓
# 参数为要比较的轮廓的列表
def getAreaMaxContour(contours):
    contour_area_temp = 0
    contour_area_max = 0
    area_max_contour = None

    for c in contours:  # 历遍所有轮廓
        contour_area_temp = math.fabs(cv2.contourArea(c))  # 计算轮廓面积
        if contour_area_temp > contour_area_max:
            contour_area_max = contour_area_temp
            if contour_area_temp > 10:  # 只有在面积大于300时，最大面积的轮廓才是有效的，以过滤干扰
                area_max_contour = c

    return area_max_contour, contour_area_max  # 返回最大的轮廓

# 初始位置
def initMove(delay=False):
    runActionGroup_srv('sit.d6ac',False)
    with lock:
        pass
        # target = ik.setPitchRanges((0, y_dis, Z_DIS), -90, -92, -88)
        # if target:
            # servo_data = target[1]
            # bus_servo_control.set_servos(joints_pub, 1500, ((1, 200), (2, 500), (3, servo_data['servo3']), (4, servo_data['servo4']), (5, servo_data['servo5']),(6, servo_data['servo6'])))
    if delay:
        rospy.sleep(2)

def turn_off_rgb():
    led = Led()
    led.index = 0
    led.rgb.r = 0
    led.rgb.g = 0
    led.rgb.b = 0
    rgb_pub.publish(led)
    rospy.sleep(0.005)
    led.index = 1
    rgb_pub.publish(led)

def turn_on_rgb(color):
    led = Led()
    led.index = 0
    led.rgb.r = range_rgb[color][2]
    led.rgb.g = range_rgb[color][1]
    led.rgb.b = range_rgb[color][0]
    rgb_pub.publish(led)
    rospy.sleep(0.005)
    led.index = 1
    rgb_pub.publish(led)
    rospy.sleep(0.1)

# 变量重置
def reset():
    global x_dis, y_dis, z_dis
    global __target_color
    
    with lock:
        x_dis = 500
        y_dis = 0.167
        z_dis = Z_DIS
        x_pid.clear()
        y_pid.clear()
        z_pid.clear()
        turn_off_rgb()
        __target_color = ''

color_range = None
# app初始化调用
def init():
    global color_range 
    
    rospy.loginfo("object tracking Init")
    color_range = rospy.get_param('/lab_config_manager/color_range_list', {})  # get lab range from ros param server
    initMove()
    reset()


def run(img):
    global PuppyMove
    global start_move, timeLast
    global x_dis, y_dis, z_dis

    img_copy = img.copy()
    img_h, img_w = img.shape[:2]

    cv2.line(img, (int(img_w / 2 - 10), int(img_h / 2)), (int(img_w / 2 + 10), int(img_h / 2)), (0, 255, 255), 2)
    cv2.line(img, (int(img_w / 2), int(img_h / 2 - 10)), (int(img_w / 2), int(img_h / 2 + 10)), (0, 255, 255), 2)

    frame_resize = cv2.resize(img_copy, size, interpolation=cv2.INTER_NEAREST)
    frame_lab = cv2.cvtColor(frame_resize, cv2.COLOR_BGR2LAB)  # 将图像转换到LAB空间

    area_max = 0
    area_max_contour = 0
    
    if __target_color in color_range:
        target_color_range = color_range[__target_color]
        frame_mask = cv2.inRange(frame_lab, tuple(target_color_range['min']), tuple(target_color_range['max']))  # 对原图像和掩模进行位运算
        eroded = cv2.erode(frame_mask, cv2.getStructuringElement(cv2.MORPH_RECT, (3, 3)))  # 腐蚀
        dilated = cv2.dilate(eroded, cv2.getStructuringElement(cv2.MORPH_RECT, (3, 3)))  # 膨胀
        contours = cv2.findContours(dilated, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_NONE)[-2]  # 找出轮廓
        area_max_contour, area_max = getAreaMaxContour(contours)  # 找出最大轮廓

    if area_max > 100:  # 有找到最大面积
        (center_x, center_y), radius = cv2.minEnclosingCircle(area_max_contour)  # 获取最小外接圆
        center_x = int(Misc.map(center_x, 0, size[0], 0, img_w))
        center_y = int(Misc.map(center_y, 0, size[1], 0, img_h))
        radius = int(Misc.map(radius, 0, size[0], 0, img_w))
        if radius > 100:
            return img
        print('center_x = %d ,center_y=%d'%(int(center_x), int(center_y)))
        cv2.circle(img, (int(center_x), int(center_y)), int(radius), range_rgb[__target_color], 2)
        if start_move:

            x_pid.Kp = 0.003
            x_pid.Ki = 0.00
            x_pid.Kd = 0.00
            x_pid.SetPoint = img_w / 2.0  # 设定
            if abs(x_pid.SetPoint - center_x) > 230:
                x_pid.Kp = 0.004

            x_pid.update(center_x)

            x_dis = x_pid.output

            x_dis = np.radians(30) if x_dis > np.radians(30) else x_dis
            x_dis = np.radians(-30) if x_dis < np.radians(-30) else x_dis
            PuppyPose['roll'] = x_dis


            if abs(area_max - 900) < 150:
                y_dis = 0
            elif area_max - 900 < -150:
                y_dis = 10
            elif area_max - 900 > 150:
                y_dis = -7
            PuppyMove['x'] = y_dis
            # PuppyVelocityPub.publish(x=PuppyMove['x'], y=PuppyMove['y'], yaw_rate=PuppyMove['yaw_rate'])

            z_pid.Kp = 0.0015
            z_pid.Ki = 0.0000
            z_pid.Kd = 0.0000
            # z_pid.setWindup(np.radians(30)/z_pid.Ki)
            z_pid.SetPoint = img_h / 2.0
            

            if abs(z_pid.SetPoint - center_y) > 180:
                z_pid.Kp = 0.002
            z_pid.update(center_y)
            z_dis = z_pid.output

            z_dis = np.radians(30) if z_dis > np.radians(30) else z_dis
            z_dis = np.radians(-20) if z_dis < np.radians(-20) else z_dis

            PuppyPose['pitch'] = z_dis
            PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift']
            ,height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'])


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
            cv2.imshow('Frame', frame_result)
            key = cv2.waitKey(1)
    # rgb_image = cv2.cvtColor(frame_result, cv2.COLOR_BGR2RGB).tobytes()
    # ros_image.data = rgb_image
    
    # rospy.sleep(0.0005)
    # image_pub.publish(ros_image)

def enter_func(msg):
    global lock
    global image_sub
    global __isRunning
    global org_image_sub_ed
    
    rospy.loginfo("enter object tracking")
    init()
    with lock:
        if not org_image_sub_ed:
            org_image_sub_ed = True
            image_sub = rospy.Subscriber('/usb_cam/image_raw', Image, image_callback)
            
    puppy_set_running_srv(True)
    return [True, 'enter']

heartbeat_timer = None
def exit_func(msg):
    global lock
    global image_sub
    global __isRunning
    global org_image_sub_ed
    
    rospy.loginfo("exit object tracking")
    with lock:
        __isRunning = False
        reset()
        try:
            if org_image_sub_ed:
                org_image_sub_ed = False
                if heartbeat_timer:heartbeat_timer.cancel()
                image_sub.unregister()
        except BaseException as e:
            rospy.loginfo('%s', e)
    

    return [True, 'exit']

def start_running():
    global lock
    global __isRunning
    
    rospy.loginfo("start running object tracking")
    with lock:
        # turn_on_rgb(__target_color)
        __isRunning = True

def stop_running():
    global lock
    global __isRunning
    
    rospy.loginfo("stop running object tracking")
    with lock:
        __isRunning = False
        reset()
        # initMove(delay=False)

def set_running(msg):
    if msg.data:
        start_running()
    else:
        stop_running()
        
    return [True, 'set_running']

def set_target(msg):
    global lock
    global __target_color
    
    rospy.loginfo("%s", msg)
    with lock:
        __target_color = msg.data
        turn_on_rgb(__target_color)
        
    return [True, 'set_target']

def heartbeat_srv_cb(msg):
    global heartbeat_timer

    if isinstance(heartbeat_timer, Timer):
        heartbeat_timer.cancel()
    if msg.data:
        heartbeat_timer = Timer(5, rospy.ServiceProxy('/object_tracking/exit', Trigger))
        heartbeat_timer.start()
    rsp = SetBoolResponse()
    rsp.success = msg.data

    return rsp


def cleanup():
    turn_off_rgb()
    print('is_shutdown')

if __name__ == '__main__':
    rospy.init_node(ROS_NODE_NAME, log_level=rospy.DEBUG)
    rospy.on_shutdown(cleanup)

    PP = rospy.get_param('/puppy_control/PuppyPose')
    PuppyPose = PP['Stand'].copy()

    PuppyVelocityPub = rospy.Publisher('/puppy_control/velocity', Velocity, queue_size=1)
    PuppyPosePub = rospy.Publisher('/puppy_control/pose', Pose, queue_size=1)


    image_pub = rospy.Publisher('/%s/image_result'%ROS_NODE_NAME, Image, queue_size=1)  # register result image publisher
    rgb_pub = rospy.Publisher('/sensor/rgb_led', Led, queue_size=1)
    
    # enter_srv = rospy.Service('/%s/enter'%ROS_NODE_NAME, Trigger, enter_func)
    # exit_srv = rospy.Service('/%s/exit'%ROS_NODE_NAME, Trigger, exit_func)
    # running_srv = rospy.Service('/%s/set_running'%ROS_NODE_NAME, SetBool, set_running)
    # set_target_srv = rospy.Service('/%s/set_target'%ROS_NODE_NAME, SetTarget, set_target)
    # heartbeat_srv = rospy.Service('/%s/heartbeat'%ROS_NODE_NAME, SetBool, heartbeat_srv_cb)
    runActionGroup_srv = rospy.ServiceProxy('/puppy_control/runActionGroup', SetRunActionName)
    puppy_set_running_srv = rospy.ServiceProxy('/puppy_control/set_running', SetBool)

    debug = True
    if debug:
        rospy.sleep(0.2)
        enter_func(1)
        
        msg = SetTarget()
        msg.data = 'red'
        
        set_target(msg)
        start_running()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        rospy.loginfo("Shutting down")
    finally:
        cv2.destroyAllWindows()
