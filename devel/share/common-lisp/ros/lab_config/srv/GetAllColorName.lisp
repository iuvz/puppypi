; Auto-generated. Do not edit!


(cl:in-package lab_config-srv)


;//! \htmlinclude GetAllColorName-request.msg.html

(cl:defclass <GetAllColorName-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetAllColorName-request (<GetAllColorName-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetAllColorName-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetAllColorName-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lab_config-srv:<GetAllColorName-request> is deprecated: use lab_config-srv:GetAllColorName-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetAllColorName-request>) ostream)
  "Serializes a message object of type '<GetAllColorName-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetAllColorName-request>) istream)
  "Deserializes a message object of type '<GetAllColorName-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetAllColorName-request>)))
  "Returns string type for a service object of type '<GetAllColorName-request>"
  "lab_config/GetAllColorNameRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetAllColorName-request)))
  "Returns string type for a service object of type 'GetAllColorName-request"
  "lab_config/GetAllColorNameRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetAllColorName-request>)))
  "Returns md5sum for a message object of type '<GetAllColorName-request>"
  "07eeaa0f3311bac2cbbe7fd861374c5c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetAllColorName-request)))
  "Returns md5sum for a message object of type 'GetAllColorName-request"
  "07eeaa0f3311bac2cbbe7fd861374c5c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetAllColorName-request>)))
  "Returns full string definition for message of type '<GetAllColorName-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetAllColorName-request)))
  "Returns full string definition for message of type 'GetAllColorName-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetAllColorName-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetAllColorName-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetAllColorName-request
))
;//! \htmlinclude GetAllColorName-response.msg.html

(cl:defclass <GetAllColorName-response> (roslisp-msg-protocol:ros-message)
  ((color_names
    :reader color_names
    :initarg :color_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass GetAllColorName-response (<GetAllColorName-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetAllColorName-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetAllColorName-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lab_config-srv:<GetAllColorName-response> is deprecated: use lab_config-srv:GetAllColorName-response instead.")))

(cl:ensure-generic-function 'color_names-val :lambda-list '(m))
(cl:defmethod color_names-val ((m <GetAllColorName-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab_config-srv:color_names-val is deprecated.  Use lab_config-srv:color_names instead.")
  (color_names m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetAllColorName-response>) ostream)
  "Serializes a message object of type '<GetAllColorName-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'color_names))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'color_names))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetAllColorName-response>) istream)
  "Deserializes a message object of type '<GetAllColorName-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'color_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'color_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetAllColorName-response>)))
  "Returns string type for a service object of type '<GetAllColorName-response>"
  "lab_config/GetAllColorNameResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetAllColorName-response)))
  "Returns string type for a service object of type 'GetAllColorName-response"
  "lab_config/GetAllColorNameResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetAllColorName-response>)))
  "Returns md5sum for a message object of type '<GetAllColorName-response>"
  "07eeaa0f3311bac2cbbe7fd861374c5c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetAllColorName-response)))
  "Returns md5sum for a message object of type 'GetAllColorName-response"
  "07eeaa0f3311bac2cbbe7fd861374c5c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetAllColorName-response>)))
  "Returns full string definition for message of type '<GetAllColorName-response>"
  (cl:format cl:nil "string[] color_names~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetAllColorName-response)))
  "Returns full string definition for message of type 'GetAllColorName-response"
  (cl:format cl:nil "string[] color_names~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetAllColorName-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'color_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetAllColorName-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetAllColorName-response
    (cl:cons ':color_names (color_names msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetAllColorName)))
  'GetAllColorName-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetAllColorName)))
  'GetAllColorName-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetAllColorName)))
  "Returns string type for a service object of type '<GetAllColorName>"
  "lab_config/GetAllColorName")