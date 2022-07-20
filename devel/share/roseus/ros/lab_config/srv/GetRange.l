;; Auto-generated. Do not edit!


(when (boundp 'lab_config::GetRange)
  (if (not (find-package "LAB_CONFIG"))
    (make-package "LAB_CONFIG"))
  (shadow 'GetRange (find-package "LAB_CONFIG")))
(unless (find-package "LAB_CONFIG::GETRANGE")
  (make-package "LAB_CONFIG::GETRANGE"))
(unless (find-package "LAB_CONFIG::GETRANGEREQUEST")
  (make-package "LAB_CONFIG::GETRANGEREQUEST"))
(unless (find-package "LAB_CONFIG::GETRANGERESPONSE")
  (make-package "LAB_CONFIG::GETRANGERESPONSE"))

(in-package "ROS")





(defclass lab_config::GetRangeRequest
  :super ros::object
  :slots (_color_name ))

(defmethod lab_config::GetRangeRequest
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

(defclass lab_config::GetRangeResponse
  :super ros::object
  :slots (_success _min _max ))

(defmethod lab_config::GetRangeResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:min __min) (make-array 0 :initial-element 0 :element-type :integer))
    ((:max __max) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _success __success)
   (setq _min __min)
   (setq _max __max)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:min
   (&optional __min)
   (if __min (setq _min __min)) _min)
  (:max
   (&optional __max)
   (if __max (setq _max __max)) _max)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; int16[] _min
    (* 2    (length _min)) 4
    ;; int16[] _max
    (* 2    (length _max)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
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
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
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

(defclass lab_config::GetRange
  :super ros::object
  :slots ())

(setf (get lab_config::GetRange :md5sum-) "c7b2c33b1c9c860ea4b8bdc266a1aed8")
(setf (get lab_config::GetRange :datatype-) "lab_config/GetRange")
(setf (get lab_config::GetRange :request) lab_config::GetRangeRequest)
(setf (get lab_config::GetRange :response) lab_config::GetRangeResponse)

(defmethod lab_config::GetRangeRequest
  (:response () (instance lab_config::GetRangeResponse :init)))

(setf (get lab_config::GetRangeRequest :md5sum-) "c7b2c33b1c9c860ea4b8bdc266a1aed8")
(setf (get lab_config::GetRangeRequest :datatype-) "lab_config/GetRangeRequest")
(setf (get lab_config::GetRangeRequest :definition-)
      "string color_name
---
bool success
int16[] min
int16[] max
")

(setf (get lab_config::GetRangeResponse :md5sum-) "c7b2c33b1c9c860ea4b8bdc266a1aed8")
(setf (get lab_config::GetRangeResponse :datatype-) "lab_config/GetRangeResponse")
(setf (get lab_config::GetRangeResponse :definition-)
      "string color_name
---
bool success
int16[] min
int16[] max
")



(provide :lab_config/GetRange "c7b2c33b1c9c860ea4b8bdc266a1aed8")


