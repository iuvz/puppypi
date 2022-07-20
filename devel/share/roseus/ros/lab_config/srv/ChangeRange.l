;; Auto-generated. Do not edit!


(when (boundp 'lab_config::ChangeRange)
  (if (not (find-package "LAB_CONFIG"))
    (make-package "LAB_CONFIG"))
  (shadow 'ChangeRange (find-package "LAB_CONFIG")))
(unless (find-package "LAB_CONFIG::CHANGERANGE")
  (make-package "LAB_CONFIG::CHANGERANGE"))
(unless (find-package "LAB_CONFIG::CHANGERANGEREQUEST")
  (make-package "LAB_CONFIG::CHANGERANGEREQUEST"))
(unless (find-package "LAB_CONFIG::CHANGERANGERESPONSE")
  (make-package "LAB_CONFIG::CHANGERANGERESPONSE"))

(in-package "ROS")





(defclass lab_config::ChangeRangeRequest
  :super ros::object
  :slots (_min _max ))

(defmethod lab_config::ChangeRangeRequest
  (:init
   (&key
    ((:min __min) (make-array 0 :initial-element 0 :element-type :integer))
    ((:max __max) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _min __min)
   (setq _max __max)
   self)
  (:min
   (&optional __min)
   (if __min (setq _min __min)) _min)
  (:max
   (&optional __max)
   (if __max (setq _max __max)) _max)
  (:serialization-length
   ()
   (+
    ;; int16[] _min
    (* 2    (length _min)) 4
    ;; int16[] _max
    (* 2    (length _max)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16[] _min
     (write-long (length _min) s)
     (dotimes (i (length _min))
       (write-word (elt _min i) s)
       )
     ;; int16[] _max
     (write-long (length _max) s)
     (dotimes (i (length _max))
       (write-word (elt _max i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16[] _min
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _min (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _min i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; int16[] _max
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _max (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _max i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(defclass lab_config::ChangeRangeResponse
  :super ros::object
  :slots (_success _message ))

(defmethod lab_config::ChangeRangeResponse
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

(defclass lab_config::ChangeRange
  :super ros::object
  :slots ())

(setf (get lab_config::ChangeRange :md5sum-) "b6426602006389ecb4fb8d1c27273f68")
(setf (get lab_config::ChangeRange :datatype-) "lab_config/ChangeRange")
(setf (get lab_config::ChangeRange :request) lab_config::ChangeRangeRequest)
(setf (get lab_config::ChangeRange :response) lab_config::ChangeRangeResponse)

(defmethod lab_config::ChangeRangeRequest
  (:response () (instance lab_config::ChangeRangeResponse :init)))

(setf (get lab_config::ChangeRangeRequest :md5sum-) "b6426602006389ecb4fb8d1c27273f68")
(setf (get lab_config::ChangeRangeRequest :datatype-) "lab_config/ChangeRangeRequest")
(setf (get lab_config::ChangeRangeRequest :definition-)
      "int16[] min
int16[] max
---
bool success
string message
")

(setf (get lab_config::ChangeRangeResponse :md5sum-) "b6426602006389ecb4fb8d1c27273f68")
(setf (get lab_config::ChangeRangeResponse :datatype-) "lab_config/ChangeRangeResponse")
(setf (get lab_config::ChangeRangeResponse :definition-)
      "int16[] min
int16[] max
---
bool success
string message
")



(provide :lab_config/ChangeRange "b6426602006389ecb4fb8d1c27273f68")


