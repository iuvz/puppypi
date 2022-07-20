#!/usr/bin/python3
# coding=utf8
# Date:2021/12/02
# Author:hiwonder
import sys
import cv2
import math
import time
import rospy
import threading
import numpy as np
from threading import RLock, Timer
from std_srvs.srv import *
from sensor_msgs.msg import Image
from sensor.msg import Led
from object_tracking.srv import *
from puppy_control.msg import Velocity, Pose, Gait

from puppy_pi import Misc


ROS_NODE_NAME = 'visual_patrol_demo'

is_shutdown = False

PuppyMove = {'x':0, 'y':0, 'yaw_rate':0}


color_range_list = {}

__isRunning = False
__target_color = ''
org_image_sub_ed = False


line_centerx = -1 # 线条中心坐标
img_centerx = 320

roi = [ # [ROI, weight]
        (240, 280,  0, 640, 0.1), 
        (320, 360,  0, 640, 0.2), 
        (400, 440,  0, 640, 0.7)
       ]
roi = [ # [ROI, weight]
        (120, 140,  0, 320, 0.1), 
        (160, 180,  0, 320, 0.2), 
        (200, 220,  0, 320, 0.7)
       ]

roi_h1 = roi[0][0]
roi_h2 = roi[1][0] - roi[0][0]
roi_h3 = roi[2][0] - roi[1][0]
roi_h_list = [roi_h1, roi_h2, roi_h3]

range_rgb = {
    'red': (0, 0, 255),
    'blue': (255, 0, 0),
    'green': (0, 255, 0),
    'black': (0, 0, 0),
    'white': (255, 255, 255),
}
draw_color = range_rgb["black"]


lock = RLock()


# 变量重置
def reset():
    global draw_color
    global __target_color
    global color_range_list
    global line_centerx
    with lock:
        turn_off_rgb()
        __target_color = 'None'
        line_centerx = -1
        draw_color = range_rgb["black"]
        color_range_list = rospy.get_param('/lab_config_manager/color_range_list')

        PuppyMove['x'] = 0
        PuppyMove['yaw_rate'] = math.radians(0)
        PuppyVelocityPub.publish(x=PuppyMove['x'], y=PuppyMove['y'], yaw_rate=PuppyMove['yaw_rate'])


# 初始位置
def initMove(delay=True):
    global GaitConfig
    PuppyMove['x'] = 0
    PuppyMove['yaw_rate'] = math.radians(0)
    PuppyVelocityPub.publish(x=PuppyMove['x'], y=PuppyMove['y'], yaw_rate=PuppyMove['yaw_rate'])
    rospy.sleep(0.2)
    rospy.ServiceProxy('/puppy_control/go_home', Empty)()
    PuppyPosePub.publish(stance_x=PuppyPose['stance_x'], stance_y=PuppyPose['stance_y'], x_shift=PuppyPose['x_shift']
            ,height=PuppyPose['height'], roll=PuppyPose['roll'], pitch=PuppyPose['pitch'], yaw=PuppyPose['yaw'], run_time = 500)
    
    rospy.sleep(0.2)
    PuppyGaitConfigPub.publish(overlap_time = GaitConfig['overlap_time'], swing_time = GaitConfig['swing_time']
                    , clearance_time = GaitConfig['clearance_time'], z_clearance = GaitConfig['z_clearance'])
                    
    with lock:
        pass
    if delay:
        rospy.sleep(0.5)

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


# app初始化调用
def init():
    print("visual patrol Init")
    initMove(True)
    reset()



def move():
    global PuppyMove
    global draw_color

    global line_centerx
    rospy.sleep(1)
    while True:
        if __isRunning:
            if line_centerx != -1:
                if abs(line_centerx - img_centerx) <= 50:
                    PuppyMove['x'] = 10
                    PuppyMove['yaw_rate'] = math.radians(0)
                elif line_centerx - img_centerx > 50:
                    PuppyMove['x'] = 8
                    PuppyMove['yaw_rate'] = math.radians(-15)
                elif line_centerx - img_centerx < -50:
                    PuppyMove['x'] = 8
                    PuppyMove['yaw_rate'] = math.radians(15)
                
                PuppyVelocityPub.publish(x=PuppyMove['x'], y=PuppyMove['y'], yaw_rate=PuppyMove['yaw_rate'])
            else:
                PuppyMove['x'] = 0
                PuppyMove['yaw_rate'] = math.radians(0)
                PuppyVelocityPub.publish(x=PuppyMove['x'], y=PuppyMove['y'], yaw_rate=PuppyMove['yaw_rate'])
            time.sleep(0.001)
        else:
            time.sleep(0.001)
        if is_shutdown:break
            
# 运行子线程
th = threading.Thread(target=move,daemon=True)
# th.start()

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
            if contour_area_temp > 50:  # 只有在面积大于50时，最大面积的轮廓才是有效的，以过滤干扰
                area_max_contour = c

    return area_max_contour, contour_area_max  # 返回最大的轮廓
def run(img):
    global draw_color, line_centerx
    size = (320, 240)
    # size = (640, 480)
    # img_copy = img.copy()
    img_h, img_w = img.shape[:2]

    if not __isRunning:
        return img

    frame_resize = cv2.resize(img, size, interpolation=cv2.INTER_NEAREST)
    frame_gb = cv2.GaussianBlur(frame_resize, (3, 3), 3)      
    frame_lab = cv2.cvtColor(frame_gb, cv2.COLOR_BGR2LAB)  # 将图像转换到LAB空间


    centroid_x_sum = 0
    weight_sum = 0
    center_ = []
    n = 0
    #将图像分割成上中下三个部分，这样处理速度会更快，更精确
    for r in roi:
        roi_h = roi_h_list[n]
        n += 1       
        if n <= 2:
            continue
        blobs = frame_gb[r[0]:r[1], r[2]:r[3]]
        frame_lab = cv2.cvtColor(blobs, cv2.COLOR_BGR2LAB)  # 将图像转换到LAB空间
        

        for i in color_range_list:
            if i in __target_color:
                detect_color = i
                
                frame_mask = cv2.inRange(frame_lab,
                                             (color_range_list[detect_color]['min'][0],
                                              color_range_list[detect_color]['min'][1],
                                              color_range_list[detect_color]['min'][2]),
                                             (color_range_list[detect_color]['max'][0],
                                              color_range_list[detect_color]['max'][1],
                                              color_range_list[detect_color]['max'][2]))  #对原图像和掩模进行位运算                
                opened = cv2.morphologyEx(frame_mask, cv2.MORPH_OPEN, np.ones((6, 6), np.uint8))  # 开运算
                closed = cv2.morphologyEx(opened, cv2.MORPH_CLOSE, np.ones((6, 6), np.uint8))  # 闭运算
        #closed[:, 0:160] = 0
        #closed[:, 480:640] = 0        
        if __target_color == '' or __target_color == 'None' or __target_color == None:
            line_centerx = -1
            return img
        cnts = cv2.findContours(closed , cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_TC89_L1)[-2]#找出所有轮廓
        cnt_large, area = getAreaMaxContour(cnts)#找到最大面积的轮廓
        if cnt_large is not None:#如果轮廓不为空
            rect = cv2.minAreaRect(cnt_large)#最小外接矩形
            box = np.int0(cv2.boxPoints(rect))#最小外接矩形的四个顶点
            for i in range(4):
                box[i, 1] = box[i, 1] + (n - 1)*roi_h + roi[0][0]
                box[i, 1] = int(Misc.map(box[i, 1], 0, size[1], 0, img_h))
            for i in range(4):                
                box[i, 0] = int(Misc.map(box[i, 0], 0, size[0], 0, img_w))
                
            cv2.drawContours(img, [box], -1, (0,0,255,255), 2)#画出四个点组成的矩形
            
            #获取矩形的对角点
            pt1_x, pt1_y = box[0, 0], box[0, 1]
            pt3_x, pt3_y = box[2, 0], box[2, 1]            
            center_x, center_y = (pt1_x + pt3_x) / 2, (pt1_y + pt3_y) / 2#中心点       
            cv2.circle(img, (int(center_x), int(center_y)), 5, (0,0,255), -1)#画出中心点
            
            center_.append([center_x, center_y])                        
            #按权重不同对上中下三个中心点进行求和
            centroid_x_sum += center_x * r[4]
            weight_sum += r[4]

    if weight_sum is not 0:
        #求最终得到的中心点
        cv2.circle(img, (line_centerx, int(center_y)), 10, (0,255,255), -1)#画出中心点
        line_centerx = int(centroid_x_sum / weight_sum)  
        # print('line_centerx',line_centerx)
    else:
        line_centerx = -1

    return img

def image_callback(ros_image):
    global lock
    
    image = np.ndarray(shape=(ros_image.height, ros_image.width, 3), dtype=np.uint8,
                       buffer=ros_image.data)  # 将自定义图像消息转化为图像
    frame = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
    
    # frame = cv2_img.copy()
    frame_result = frame
    with lock:
        if __isRunning:
            frame_result = run(frame)
            cv2.imshow('Frame', frame_result)
            key = cv2.waitKey(1)
    # rgb_image = cv2.cvtColor(frame_result, cv2.COLOR_BGR2RGB).tobytes()
    # ros_image.data = rgb_image
    # image_pub.publish(ros_image)

def enter_func(msg):
    global lock
    global image_sub
    global __isRunning
    global org_image_sub_ed

    rospy.loginfo("enter visual patrol")
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
    
    rospy.loginfo("exit visual patrol")
    with lock:
        __isRunning = False
        
        reset()
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

    rospy.loginfo("start running")
    with lock:
        __isRunning = True

def stop_running():
    global lock
    global __isRunning

    rospy.loginfo("stop running")
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
        heartbeat_timer = Timer(5, rospy.ServiceProxy('/%s/exit'%ROS_NODE_NAME, Trigger))
        heartbeat_timer.start()
    rsp = SetBoolResponse()
    rsp.success = msg.data

    return rsp

def cleanup():
    global is_shutdown
    is_shutdown = True
    PuppyVelocityPub.publish(x=0, y=0, yaw_rate=0)
    print('is_shutdown')
if __name__ == '__main__':
    rospy.init_node(ROS_NODE_NAME, log_level=rospy.INFO)
    rospy.on_shutdown(cleanup)
    
    PP = rospy.get_param('/puppy_control/PuppyPose')
    PuppyPose = PP['LookDown_20deg'].copy()
    # PG = rospy.get_param('/puppy_control/GaitConfig')
    # GaitConfig = PG['GaitConfigFast'].copy()
    GaitConfig = {'overlap_time':0.1, 'swing_time':0.15, 'clearance_time':0.0, 'z_clearance':3}
    
    image_pub = rospy.Publisher('/%s/image_result'%ROS_NODE_NAME, Image, queue_size=1)  # register result image publisher
    rgb_pub = rospy.Publisher('/sensor/rgb_led', Led, queue_size=1)

    # enter_srv = rospy.Service('/%s/enter'%ROS_NODE_NAME, Trigger, enter_func)
    # exit_srv = rospy.Service('/%s/exit'%ROS_NODE_NAME, Trigger, exit_func)
    # running_srv = rospy.Service('/%s/set_running'%ROS_NODE_NAME, SetBool, set_running)
    # set_target_srv = rospy.Service('/%s/set_target'%ROS_NODE_NAME, SetTarget, set_target)
    # heartbeat_srv = rospy.Service('/%s/heartbeat'%ROS_NODE_NAME, SetBool, heartbeat_srv_cb)

    PuppyGaitConfigPub = rospy.Publisher('/puppy_control/gait', Gait, queue_size=1)
    PuppyVelocityPub = rospy.Publisher('/puppy_control/velocity', Velocity, queue_size=1)
    PuppyPosePub = rospy.Publisher('/puppy_control/pose', Pose, queue_size=1)
    rospy.sleep(0.2)
    
    th.start()
    debug = True
    if debug:
        enter_func(1)
        start_running()
        __target_color = 'red'
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    finally:
        cv2.destroyAllWindows()
