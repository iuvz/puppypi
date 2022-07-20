;; Auto-generated. Do not edit!


(when (boundp 'lab_config::StashRange)
  (if (not (find-package "LAB_CONFIG"))
    (make-package "LAB_CONFIG"))
  (shadow 'StashRange (find-package "LAB_CONFIG")))
(unless (find-package "LAB_CONFIG::STASHRANGE")
  (make-package "LAB_CONFIG::STASHRANGE"))
(unless (find-package "LAB_CONFIG::STASHRANGEREQUEST")
  (make-package "LAB_CONFIG::STASHRANGEREQUEST"))
(unless (find-package "LAB_CONFIG::STASHRANGERESPONSE")
  (make-package "LAB_CONFIG::STASHRANGERESPONSE"))

(in-package "ROS")





(defclass lab_config::StashRangeRequest
  :super ros::object
  :slots (_color_name ))

(defmethod lab_config::StashRangeRequest
  (:init
   (&key
    ((:color_name __color_name) "")
    )
   (send-super :init)
   (setq _color_name (string __color_name))
   self)
  (:color_name
   (&optional __color_name)
   (if __color_name (setq _color_name __color_name)) _color_name)
  (:serialization-length
   ()
   (+
    ;; string _color_name
    4 (length _color_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _color_name
       (write-long (length _color_name) s) (princ _color_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _color_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _color_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass lab_config::StashRangeResponse
  :super ros::object
  :slots (_success _message ))

(defmethod lab_config::StashRangeResponse
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

(defclass lab_config::StashRange
  :super ros::object
  :slots ())

(setf (get lab_config::StashRange :md5sum-) "b043027b67620a7221fbfd7733360ab7")
(setf (get lab_config::StashRange :datatype-) "lab_config/StashRange")
(setf (get lab_config::StashRange :request) lab_config::StashRangeRequest)
(setf (get lab_config::StashRange :response) lab_config::StashRangeResponse)

(defmethod lab_config::StashRangeRequest
  (:response () (instance lab_config::StashRangeResponse :init)))

(setf (get lab_config::StashRangeRequest :md5sum-) "b043027b67620a7221fbfd7733360ab7")
(setf (get lab_config::StashRangeRequest :datatype-) "lab_config/StashRangeRequest")
(setf (get lab_config::StashRangeRequest :definition-)
      "string color_name
---
bool success
string message

")

(setf (get lab_config::StashRangeResponse :md5sum-) "b043027b67620a7221fbfd7733360ab7")
(setf (get lab_config::StashRangeResponse :datatype-) "lab_config/StashRangeResponse")
(setf (get lab_config::StashRangeResponse :definition-)
      "string color_name
---
bool success
string message

")



(provide :lab_config/StashRange "b043027b67620a7221fbfd7733360ab7")


