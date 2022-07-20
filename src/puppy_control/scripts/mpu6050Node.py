#!/usr/bin/env python3
# encoding: utf-8

import sys
import rospy
from sensor_msgs.msg import Imu

HomePath = '/home/pi'
sys.path.append(HomePath + '/PuppyPi_PC_Software')
from mpu6050_base import MPU6050Base

class MPU6050(MPU6050Base):

    def __init__(self, address=0x68, bus=1):
        rospy.init_node('mpu6050Node')
        MPU6050Base.__init__(self, address, bus)
        self.rate = rospy.Rate(100)  # 100hz
        self.data = None#self.get_all_data()

        
        self.seq = 0
        self.frame_name = rospy.get_param('~frame_name', "imu")
        self.pub_imu = rospy.Publisher('/imu', Imu, queue_size=1)

       
    def pub(self):
        while not rospy.is_shutdown():
            self.rate.sleep()

            self.data = self.get_all_data()
            self.imu_msg = Imu()
            self.imu_msg.linear_acceleration.x = self.data['accel'][0]
            self.imu_msg.linear_acceleration.y = self.data['accel'][1]
            self.imu_msg.linear_acceleration.z = self.data['accel'][2]

            self.imu_msg.angular_velocity.x = self.data['gyro'][0]
            self.imu_msg.angular_velocity.y = self.data['gyro'][1]
            self.imu_msg.angular_velocity.z = self.data['gyro'][2]

            self.imu_msg.orientation.x = 0
            self.imu_msg.orientation.y = 0
            self.imu_msg.orientation.z = 0
            self.imu_msg.orientation.w = 1

            self.imu_msg.header.stamp = rospy.Time.now()
            self.imu_msg.header.frame_id = self.frame_name
            self.imu_msg.header.seq = self.seq

            self.pub_imu.publish(self.imu_msg)
            self.seq += 1
 

if __name__ == "__main__":

    mpu = MPU6050()
    try:
        mpu.pub()
    except :
        pass
    finally:
        pass