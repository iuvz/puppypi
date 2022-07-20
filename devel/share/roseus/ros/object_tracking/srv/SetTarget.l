;; Auto-generated. Do not edit!


(when (boundp 'object_tracking::SetTarget)
  (if (not (find-package "OBJECT_TRACKING"))
    (make-package "OBJECT_TRACKING"))
  (shadow 'SetTarget (find-package "OBJECT_TRACKING")))
(unless (find-package "OBJECT_TRACKING::SETTARGET")
  (make-package "OBJECT_TRACKING::SETTARGET"))
(unless (find-package "OBJECT_TRACKING::SETTARGETREQUEST")
  (make-package "OBJECT_TRACKING::SETTARGETREQUEST"))
(unless (find-package "OBJECT_TRACKING::SETTARGETRESPONSE")
  (make-package "OBJECT_TRACKING::SETTARGETRESPONSE"))

(in-package "ROS")





(defclass object_tracking::SetTargetRequest
  :super ros::object
  :slots (_data ))

(defmethod object_tracking::SetTargetRequest
  (:init
   (&key
    ((:data __data) "")
    )
   (send-super :init)
   (setq _data (string __data))
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; string _data
    4 (length _data)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _data
       (write-long (length _data) s) (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _data
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _data (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass object_tracking::SetTargetResponse
  :super ros::object
  :slots (_success _message ))

(defmethod object_tracking::SetTargetResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass object_tracking::SetTarget
  :super ros::object
  :slots ())

(setf (get object_tracking::SetTarget :md5sum-) "546971982e3fbbd5a41e60fb6432e357")
(setf (get object_tracking::SetTarget :datatype-) "object_tracking/SetTarget")
(setf (get object_tracking::SetTarget :request) object_tracking::SetTargetRequest)
(setf (get object_tracking::SetTarget :response) object_tracking::SetTargetResponse)

(defmethod object_tracking::SetTargetRequest
  (:response () (instance object_tracking::SetTargetResponse :init)))

(setf (get object_tracking::SetTargetRequest :md5sum-) "546971982e3fbbd5a41e60fb6432e357")
(setf (get object_tracking::SetTargetRequest :datatype-) "object_tracking/SetTargetRequest")
(setf (get object_tracking::SetTargetRequest :definition-)
      "string data
---
bool success
string message

")

(setf (get object_tracking::SetTargetResponse :md5sum-) "546971982e3fbbd5a41e60fb6432e357")
(setf (get object_tracking::SetTargetResponse :datatype-) "object_tracking/SetTargetResponse")
(setf (get object_tracking::SetTargetResponse :definition-)
      "string data
---
bool success
string message

")



(provide :object_tracking/SetTarget "546971982e3fbbd5a41e60fb6432e357")


