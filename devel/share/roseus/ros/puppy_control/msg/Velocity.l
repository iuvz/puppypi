;; Auto-generated. Do not edit!


(when (boundp 'puppy_control::Velocity)
  (if (not (find-package "PUPPY_CONTROL"))
    (make-package "PUPPY_CONTROL"))
  (shadow 'Velocity (find-package "PUPPY_CONTROL")))
(unless (find-package "PUPPY_CONTROL::VELOCITY")
  (make-package "PUPPY_CONTROL::VELOCITY"))

(in-package "ROS")
;;//! \htmlinclude Velocity.msg.html


(defclass puppy_control::Velocity
  :super ros::object
  :slots (_x _y _yaw_rate ))

(defmethod puppy_control::Velocity
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:yaw_rate __yaw_rate) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _yaw_rate (float __yaw_rate))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:yaw_rate
   (&optional __yaw_rate)
   (if __yaw_rate (setq _yaw_rate __yaw_rate)) _yaw_rate)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _yaw_rate
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw_rate
       (sys::poke _yaw_rate (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw_rate
     (setq _yaw_rate (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get puppy_control::Velocity :md5sum-) "ad70c6ce8f1b0a052968829ccde7f72d")
(setf (get puppy_control::Velocity :datatype-) "puppy_control/Velocity")
(setf (get puppy_control::Velocity :definition-)
      "float32 x
float32 y
float32 yaw_rate
")



(provide :puppy_control/Velocity "ad70c6ce8f1b0a052968829ccde7f72d")


