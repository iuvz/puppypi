;; Auto-generated. Do not edit!


(when (boundp 'puppy_control::Pose)
  (if (not (find-package "PUPPY_CONTROL"))
    (make-package "PUPPY_CONTROL"))
  (shadow 'Pose (find-package "PUPPY_CONTROL")))
(unless (find-package "PUPPY_CONTROL::POSE")
  (make-package "PUPPY_CONTROL::POSE"))

(in-package "ROS")
;;//! \htmlinclude Pose.msg.html


(defclass puppy_control::Pose
  :super ros::object
  :slots (_roll _pitch _yaw _height _x_shift _stance_x _stance_y _run_time ))

(defmethod puppy_control::Pose
  (:init
   (&key
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:height __height) 0.0)
    ((:x_shift __x_shift) 0.0)
    ((:stance_x __stance_x) 0.0)
    ((:stance_y __stance_y) 0.0)
    ((:run_time __run_time) 0)
    )
   (send-super :init)
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _height (float __height))
   (setq _x_shift (float __x_shift))
   (setq _stance_x (float __stance_x))
   (setq _stance_y (float __stance_y))
   (setq _run_time (round __run_time))
   self)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:x_shift
   (&optional __x_shift)
   (if __x_shift (setq _x_shift __x_shift)) _x_shift)
  (:stance_x
   (&optional __stance_x)
   (if __stance_x (setq _stance_x __stance_x)) _stance_x)
  (:stance_y
   (&optional __stance_y)
   (if __stance_y (setq _stance_y __stance_y)) _stance_y)
  (:run_time
   (&optional __run_time)
   (if __run_time (setq _run_time __run_time)) _run_time)
  (:serialization-length
   ()
   (+
    ;; float32 _roll
    4
    ;; float32 _pitch
    4
    ;; float32 _yaw
    4
    ;; float32 _height
    4
    ;; float32 _x_shift
    4
    ;; float32 _stance_x
    4
    ;; float32 _stance_y
    4
    ;; int32 _run_time
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _height
       (sys::poke _height (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _x_shift
       (sys::poke _x_shift (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _stance_x
       (sys::poke _stance_x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _stance_y
       (sys::poke _stance_y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int32 _run_time
       (write-long _run_time s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _roll
     (setq _roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _height
     (setq _height (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _x_shift
     (setq _x_shift (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _stance_x
     (setq _stance_x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _stance_y
     (setq _stance_y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int32 _run_time
     (setq _run_time (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get puppy_control::Pose :md5sum-) "baecb41f8598067f3a25cfb12cfeb74d")
(setf (get puppy_control::Pose :datatype-) "puppy_control/Pose")
(setf (get puppy_control::Pose :definition-)
      "float32 roll
float32 pitch
float32 yaw
float32 height
float32 x_shift
float32 stance_x
float32 stance_y

int32 run_time
")



(provide :puppy_control/Pose "baecb41f8598067f3a25cfb12cfeb74d")


