;; Auto-generated. Do not edit!


(when (boundp 'sensor::Servo)
  (if (not (find-package "SENSOR"))
    (make-package "SENSOR"))
  (shadow 'Servo (find-package "SENSOR")))
(unless (find-package "SENSOR::SERVO")
  (make-package "SENSOR::SERVO"))

(in-package "ROS")
;;//! \htmlinclude Servo.msg.html


(defclass sensor::Servo
  :super ros::object
  :slots (_id _pulse _time ))

(defmethod sensor::Servo
  (:init
   (&key
    ((:id __id) 0)
    ((:pulse __pulse) 0)
    ((:time __time) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _pulse (round __pulse))
   (setq _time (round __time))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:pulse
   (&optional __pulse)
   (if __pulse (setq _pulse __pulse)) _pulse)
  (:time
   (&optional __time)
   (if __time (setq _time __time)) _time)
  (:serialization-length
   ()
   (+
    ;; int8 _id
    1
    ;; int32 _pulse
    4
    ;; int32 _time
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _id
       (write-byte _id s)
     ;; int32 _pulse
       (write-long _pulse s)
     ;; int32 _time
       (write-long _time s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _id 127) (setq _id (- _id 256)))
   ;; int32 _pulse
     (setq _pulse (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _time
     (setq _time (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get sensor::Servo :md5sum-) "27fba4c6dd04ddcfa19ba8394a1086e6")
(setf (get sensor::Servo :datatype-) "sensor/Servo")
(setf (get sensor::Servo :definition-)
      "int8 id
int32 pulse
int32 time

")



(provide :sensor/Servo "27fba4c6dd04ddcfa19ba8394a1086e6")


