;; Auto-generated. Do not edit!


(when (boundp 'puppy_control::Gait)
  (if (not (find-package "PUPPY_CONTROL"))
    (make-package "PUPPY_CONTROL"))
  (shadow 'Gait (find-package "PUPPY_CONTROL")))
(unless (find-package "PUPPY_CONTROL::GAIT")
  (make-package "PUPPY_CONTROL::GAIT"))

(in-package "ROS")
;;//! \htmlinclude Gait.msg.html


(defclass puppy_control::Gait
  :super ros::object
  :slots (_overlap_time _swing_time _clearance_time _z_clearance ))

(defmethod puppy_control::Gait
  (:init
   (&key
    ((:overlap_time __overlap_time) 0.0)
    ((:swing_time __swing_time) 0.0)
    ((:clearance_time __clearance_time) 0.0)
    ((:z_clearance __z_clearance) 0.0)
    )
   (send-super :init)
   (setq _overlap_time (float __overlap_time))
   (setq _swing_time (float __swing_time))
   (setq _clearance_time (float __clearance_time))
   (setq _z_clearance (float __z_clearance))
   self)
  (:overlap_time
   (&optional __overlap_time)
   (if __overlap_time (setq _overlap_time __overlap_time)) _overlap_time)
  (:swing_time
   (&optional __swing_time)
   (if __swing_time (setq _swing_time __swing_time)) _swing_time)
  (:clearance_time
   (&optional __clearance_time)
   (if __clearance_time (setq _clearance_time __clearance_time)) _clearance_time)
  (:z_clearance
   (&optional __z_clearance)
   (if __z_clearance (setq _z_clearance __z_clearance)) _z_clearance)
  (:serialization-length
   ()
   (+
    ;; float32 _overlap_time
    4
    ;; float32 _swing_time
    4
    ;; float32 _clearance_time
    4
    ;; float32 _z_clearance
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _overlap_time
       (sys::poke _overlap_time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _swing_time
       (sys::poke _swing_time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _clearance_time
       (sys::poke _clearance_time (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z_clearance
       (sys::poke _z_clearance (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _overlap_time
     (setq _overlap_time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _swing_time
     (setq _swing_time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _clearance_time
     (setq _clearance_time (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z_clearance
     (setq _z_clearance (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get puppy_control::Gait :md5sum-) "85570b63b58df2eb52f0cdc5f4a30db8")
(setf (get puppy_control::Gait :datatype-) "puppy_control/Gait")
(setf (get puppy_control::Gait :definition-)
      "float32 overlap_time
float32 swing_time
float32 clearance_time
float32 z_clearance

")



(provide :puppy_control/Gait "85570b63b58df2eb52f0cdc5f4a30db8")


