;; Auto-generated. Do not edit!


(when (boundp 'sensor::Motor)
  (if (not (find-package "SENSOR"))
    (make-package "SENSOR"))
  (shadow 'Motor (find-package "SENSOR")))
(unless (find-package "SENSOR::MOTOR")
  (make-package "SENSOR::MOTOR"))

(in-package "ROS")
;;//! \htmlinclude Motor.msg.html


(defclass sensor::Motor
  :super ros::object
  :slots (_index _speed ))

(defmethod sensor::Motor
  (:init
   (&key
    ((:index __index) 0)
    ((:speed __speed) 0)
    )
   (send-super :init)
   (setq _index (round __index))
   (setq _speed (round __speed))
   self)
  (:index
   (&optional __index)
   (if __index (setq _index __index)) _index)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; uint8 _index
    1
    ;; int8 _speed
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _index
       (write-byte _index s)
     ;; int8 _speed
       (write-byte _speed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _index
     (setq _index (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; int8 _speed
     (setq _speed (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _speed 127) (setq _speed (- _speed 256)))
   ;;
   self)
  )

(setf (get sensor::Motor :md5sum-) "6631b649aaef98f52c932c2b9322446d")
(setf (get sensor::Motor :datatype-) "sensor/Motor")
(setf (get sensor::Motor :definition-)
      "uint8 index
int8 speed

")



(provide :sensor/Motor "6631b649aaef98f52c932c2b9322446d")


