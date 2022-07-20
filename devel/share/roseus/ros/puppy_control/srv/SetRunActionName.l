;; Auto-generated. Do not edit!


(when (boundp 'puppy_control::SetRunActionName)
  (if (not (find-package "PUPPY_CONTROL"))
    (make-package "PUPPY_CONTROL"))
  (shadow 'SetRunActionName (find-package "PUPPY_CONTROL")))
(unless (find-package "PUPPY_CONTROL::SETRUNACTIONNAME")
  (make-package "PUPPY_CONTROL::SETRUNACTIONNAME"))
(unless (find-package "PUPPY_CONTROL::SETRUNACTIONNAMEREQUEST")
  (make-package "PUPPY_CONTROL::SETRUNACTIONNAMEREQUEST"))
(unless (find-package "PUPPY_CONTROL::SETRUNACTIONNAMERESPONSE")
  (make-package "PUPPY_CONTROL::SETRUNACTIONNAMERESPONSE"))

(in-package "ROS")





(defclass puppy_control::SetRunActionNameRequest
  :super ros::object
  :slots (_name _wait ))

(defmethod puppy_control::SetRunActionNameRequest
  (:init
   (&key
    ((:name __name) "")
    ((:wait __wait) nil)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _wait __wait)
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:wait
   (&optional (__wait :null))
   (if (not (eq __wait :null)) (setq _wait __wait)) _wait)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; bool _wait
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; bool _wait
       (if _wait (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _wait
     (setq _wait (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass puppy_control::SetRunActionNameResponse
  :super ros::object
  :slots (_success _message ))

(defmethod puppy_control::SetRunActionNameResponse
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

(defclass puppy_control::SetRunActionName
  :super ros::object
  :slots ())

(setf (get puppy_control::SetRunActionName :md5sum-) "b7336d7e4c3e9d0199fd9c319d9a619a")
(setf (get puppy_control::SetRunActionName :datatype-) "puppy_control/SetRunActionName")
(setf (get puppy_control::SetRunActionName :request) puppy_control::SetRunActionNameRequest)
(setf (get puppy_control::SetRunActionName :response) puppy_control::SetRunActionNameResponse)

(defmethod puppy_control::SetRunActionNameRequest
  (:response () (instance puppy_control::SetRunActionNameResponse :init)))

(setf (get puppy_control::SetRunActionNameRequest :md5sum-) "b7336d7e4c3e9d0199fd9c319d9a619a")
(setf (get puppy_control::SetRunActionNameRequest :datatype-) "puppy_control/SetRunActionNameRequest")
(setf (get puppy_control::SetRunActionNameRequest :definition-)
      "string name
bool wait
---
bool success
string message

")

(setf (get puppy_control::SetRunActionNameResponse :md5sum-) "b7336d7e4c3e9d0199fd9c319d9a619a")
(setf (get puppy_control::SetRunActionNameResponse :datatype-) "puppy_control/SetRunActionNameResponse")
(setf (get puppy_control::SetRunActionNameResponse :definition-)
      "string name
bool wait
---
bool success
string message

")



(provide :puppy_control/SetRunActionName "b7336d7e4c3e9d0199fd9c319d9a619a")


