#!/usr/bin/python3
#coding=utf8
import os
import sys
import rospy
import RPi.GPIO as GPIO
from sensor.msg import *
from std_msgs.msg import *
from smbus2 import SMBus, i2c_msg
from rpi_ws281x import PixelStrip
from rpi_ws281x import Color as PixelColor

#幻尔科技raspberrypi扩展板sdk#
__ADC_BAT_ADDR = 0
__SERVO_ADDR   = 21
__MOTOR_ADDR   = 31
__SERVO_ADDR_CMD  = 40

__motor_speed = [0, 0, 0, 0]
__servo_angle = [0, 0, 0, 0, 0, 0]
__servo_pulse = [0, 0, 0, 0, 0, 0]
__i2c = 1
__i2c_addr = 0x7A

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)

__RGB_COUNT = 2
__RGB_PIN = 12
__RGB_FREQ_HZ = 800000
__RGB_DMA = 10
__RGB_BRIGHTNESS = 120
__RGB_CHANNEL = 0
__RGB_INVERT = False
RGB = PixelStrip(__RGB_COUNT, __RGB_PIN, __RGB_FREQ_HZ, __RGB_DMA, __RGB_INVERT, __RGB_BRIGHTNESS, __RGB_CHANNEL)
RGB.begin()
for i in range(RGB.numPixels()):
    RGB.setPixelColor(i, PixelColor(0,0,0))
    RGB.show()

# rgb灯控制
def setRGB(msg):
    RGB.setPixelColor(msg.index, PixelColor(msg.rgb.r, msg.rgb.g, msg.rgb.b))
    RGB.show()

# 电机控制
def setMotor(msg):
    try:
        index = msg.index
        speed = msg.speed
        if index < 1 or index > 4:
            raise AttributeError("Invalid motor num: %d"%index)
        index = index - 1
        speed = 100 if speed > 100 else speed
        speed = -100 if speed < -100 else speed
        speed = -speed
        reg = __MOTOR_ADDR + index
        with SMBus(__i2c) as bus:
            msg = i2c_msg.write(__i2c_addr, [reg, speed.to_bytes(1, 'little', signed=True)[0]])
            bus.i2c_rdwr(msg)
            __motor_speed[index] = speed
    except:
        pass

# pwm舵机控制
def setPWMServoPulse(msg):
    try:
        servo_id = msg.id
        pulse = msg.pulse
        use_time = msg.time
        
        if servo_id< 1 or servo_id > 6:
            raise AttributeError("Invalid Servo ID: %d" %servo_id)
        index = servo_id - 1

        pulse = 500 if pulse < 500 else pulse
        pulse = 2500 if pulse > 2500 else pulse
        use_time = 0 if use_time < 0 else use_time
        use_time = 30000 if use_time > 30000 else use_time
        buf = [__SERVO_ADDR_CMD, 1] + list(use_time.to_bytes(2, 'little')) + [servo_id,] + list(pulse.to_bytes(2, 'little'))

        with SMBus(__i2c) as bus:
            msg = i2c_msg.write(__i2c_addr, buf)
            bus.i2c_rdwr(msg)
            __servo_pulse[index] = pulse
            __servo_angle[index] = int((pulse - 500) * 0.09)

    except:
        pass

# 获取电压
def getBattery():
    try:
        ret = 0
        with SMBus(__i2c) as bus:
            msg = i2c_msg.write(__i2c_addr, [__ADC_BAT_ADDR,])
            bus.i2c_rdwr(msg)
            read = i2c_msg.read(__i2c_addr, 2)
            bus.i2c_rdwr(read)
            ret = int.from_bytes(bytes(list(read)), 'little')
        return ret
    except:
        return 0

# 蜂鸣器驱动
def setBuzzer(msg):
    GPIO.setup(21, GPIO.OUT)
    GPIO.output(21, 1)
    rospy.sleep(msg.data)
    GPIO.setup(21, GPIO.OUT)
    GPIO.output(21, 0)

if __name__ == '__main__':
    rospy.init_node('sensor')

    rgb_led = rospy.Subscriber("/sensor/rgb_led", Led, setRGB)
    buzzer_sub = rospy.Subscriber("/sensor/buzzer", Float32, setBuzzer)
    # motor_sub = rospy.Subscriber("/sensor/motor", Motor, setMotor)
    # servo_sub = rospy.Subscriber("/sensor/servo", Servo, setPWMServoPulse)
    # battery_pub = rospy.Publisher('/sensor/battery', Int32, queue_size=1)
    rospy.sleep(0.2)
    
    # fan = Motor()
    # fan.index = 1
    # fan.speed = -100
    # setMotor(fan)

    rate = rospy.Rate(2)
    try:
        while not rospy.is_shutdown():
            # battery_pub.publish(getBattery())
            rate.sleep()
    except KeyboardInterrupt:
        rospy.loginfo("Shutting down")
