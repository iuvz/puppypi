;; Auto-generated. Do not edit!


(when (boundp 'sensor::Led)
  (if (not (find-package "SENSOR"))
    (make-package "SENSOR"))
  (shadow 'Led (find-package "SENSOR")))
(unless (find-package "SENSOR::LED")
  (make-package "SENSOR::LED"))

(in-package "ROS")
;;//! \htmlinclude Led.msg.html


(defclass sensor::Led
  :super ros::object
  :slots (_index _rgb ))

(defmethod sensor::Led
  (:init
   (&key
    ((:index __index) 0)
    ((:rgb __rgb) (instance sensor::RGB :init))
    )
   (send-super :init)
   (setq _index (round __index))
   (setq _rgb __rgb)
   self)
  (:index
   (&optional __index)
   (if __index (setq _index __index)) _index)
  (:rgb
   (&rest __rgb)
   (if (keywordp (car __rgb))
       (send* _rgb __rgb)
     (progn
       (if __rgb (setq _rgb (car __rgb)))
       _rgb)))
  (:serialization-length
   ()
   (+
    ;; uint8 _index
    1
    ;; sensor/RGB _rgb
    (send _rgb :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _index
       (write-byte _index s)
     ;; sensor/RGB _rgb
       (send _rgb :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _index
     (setq _index (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; sensor/RGB _rgb
     (send _rgb :deserialize buf ptr-) (incf ptr- (send _rgb :serialization-length))
   ;;
   self)
  )

(setf (get sensor::Led :md5sum-) "30e1b14f90ea917fa794eb562e3a6723")
(setf (get sensor::Led :datatype-) "sensor/Led")
(setf (get sensor::Led :definition-)
      "uint8 index
sensor/RGB rgb

================================================================================
MSG: sensor/RGB
uint8 r
uint8 g
uint8 b

")



(provide :sensor/Led "30e1b14f90ea917fa794eb562e3a6723")


