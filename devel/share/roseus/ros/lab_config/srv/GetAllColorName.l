;; Auto-generated. Do not edit!


(when (boundp 'lab_config::GetAllColorName)
  (if (not (find-package "LAB_CONFIG"))
    (make-package "LAB_CONFIG"))
  (shadow 'GetAllColorName (find-package "LAB_CONFIG")))
(unless (find-package "LAB_CONFIG::GETALLCOLORNAME")
  (make-package "LAB_CONFIG::GETALLCOLORNAME"))
(unless (find-package "LAB_CONFIG::GETALLCOLORNAMEREQUEST")
  (make-package "LAB_CONFIG::GETALLCOLORNAMEREQUEST"))
(unless (find-package "LAB_CONFIG::GETALLCOLORNAMERESPONSE")
  (make-package "LAB_CONFIG::GETALLCOLORNAMERESPONSE"))

(in-package "ROS")





(defclass lab_config::GetAllColorNameRequest
  :super ros::object
  :slots ())

(defmethod lab_config::GetAllColorNameRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass lab_config::GetAllColorNameResponse
  :super ros::object
  :slots (_color_names ))

(defmethod lab_config::GetAllColorNameResponse
  (:init
   (&key
    ((:color_names __color_names) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _color_names __color_names)
   self)
  (:color_names
   (&optional __color_names)
   (if __color_names (setq _color_names __color_names)) _color_names)
  (:serialization-length
   ()
   (+
    ;; string[] _color_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _color_names)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _color_names
     (write-long (length _color_names) s)
     (dolist (elem _color_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _color_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _color_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _color_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass lab_config::GetAllColorName
  :super ros::object
  :slots ())

(setf (get lab_config::GetAllColorName :md5sum-) "07eeaa0f3311bac2cbbe7fd861374c5c")
(setf (get lab_config::GetAllColorName :datatype-) "lab_config/GetAllColorName")
(setf (get lab_config::GetAllColorName :request) lab_config::GetAllColorNameRequest)
(setf (get lab_config::GetAllColorName :response) lab_config::GetAllColorNameResponse)

(defmethod lab_config::GetAllColorNameRequest
  (:response () (instance lab_config::GetAllColorNameResponse :init)))

(setf (get lab_config::GetAllColorNameRequest :md5sum-) "07eeaa0f3311bac2cbbe7fd861374c5c")
(setf (get lab_config::GetAllColorNameRequest :datatype-) "lab_config/GetAllColorNameRequest")
(setf (get lab_config::GetAllColorNameRequest :definition-)
      "---
string[] color_names
")

(setf (get lab_config::GetAllColorNameResponse :md5sum-) "07eeaa0f3311bac2cbbe7fd861374c5c")
(setf (get lab_config::GetAllColorNameResponse :datatype-) "lab_config/GetAllColorNameResponse")
(setf (get lab_config::GetAllColorNameResponse :definition-)
      "---
string[] color_names
")



(provide :lab_config/GetAllColorName "07eeaa0f3311bac2cbbe7fd861374c5c")


