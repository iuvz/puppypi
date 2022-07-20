; Auto-generated. Do not edit!


(cl:in-package lab_config-srv)


;//! \htmlinclude GetRange-request.msg.html

(cl:defclass <GetRange-request> (roslisp-msg-protocol:ros-message)
  ((color_name
    :reader color_name
    :initarg :color_name
    :type cl:string
    :initform ""))
)

(cl:defclass GetRange-request (<GetRange-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetRange-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetRange-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lab_config-srv:<GetRange-request> is deprecated: use lab_config-srv:GetRange-request instead.")))

(cl:ensure-generic-function 'color_name-val :lambda-list '(m))
(cl:defmethod color_name-val ((m <GetRange-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab_config-srv:color_name-val is deprecated.  Use lab_config-srv:color_name instead.")
  (color_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetRange-request>) ostream)
  "Serializes a message object of type '<GetRange-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'color_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'color_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetRange-request>) istream)
  "Deserializes a message object of type '<GetRange-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'color_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'color_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetRange-request>)))
  "Returns string type for a service object of type '<GetRange-request>"
  "lab_config/GetRangeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRange-request)))
  "Returns string type for a service object of type 'GetRange-request"
  "lab_config/GetRangeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetRange-request>)))
  "Returns md5sum for a message object of type '<GetRange-request>"
  "c7b2c33b1c9c860ea4b8bdc266a1aed8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetRange-request)))
  "Returns md5sum for a message object of type 'GetRange-request"
  "c7b2c33b1c9c860ea4b8bdc266a1aed8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetRange-request>)))
  "Returns full string definition for message of type '<GetRange-request>"
  (cl:format cl:nil "string color_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetRange-request)))
  "Returns full string definition for message of type 'GetRange-request"
  (cl:format cl:nil "string color_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetRange-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'color_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetRange-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetRange-request
    (cl:cons ':color_name (color_name msg))
))
;//! \htmlinclude GetRange-response.msg.html

(cl:defclass <GetRange-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (min
    :reader min
    :initarg :min
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0))
   (max
    :reader max
    :initarg :max
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass GetRange-response (<GetRange-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetRange-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetRange-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lab_config-srv:<GetRange-response> is deprecated: use lab_config-srv:GetRange-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GetRange-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab_config-srv:success-val is deprecated.  Use lab_config-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'min-val :lambda-list '(m))
(cl:defmethod min-val ((m <GetRange-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab_config-srv:min-val is deprecated.  Use lab_config-srv:min instead.")
  (min m))

(cl:ensure-generic-function 'max-val :lambda-list '(m))
(cl:defmethod max-val ((m <GetRange-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab_config-srv:max-val is deprecated.  Use lab_config-srv:max instead.")
  (max m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetRange-response>) ostream)
  "Serializes a message object of type '<GetRange-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'min))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'min))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'max))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'max))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetRange-response>) istream)
  "Deserializes a message object of type '<GetRange-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'min) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'min)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'max) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'max)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetRange-response>)))
  "Returns string type for a service object of type '<GetRange-response>"
  "lab_config/GetRangeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRange-response)))
  "Returns string type for a service object of type 'GetRange-response"
  "lab_config/GetRangeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetRange-response>)))
  "Returns md5sum for a message object of type '<GetRange-response>"
  "c7b2c33b1c9c860ea4b8bdc266a1aed8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetRange-response)))
  "Returns md5sum for a message object of type 'GetRange-response"
  "c7b2c33b1c9c860ea4b8bdc266a1aed8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetRange-response>)))
  "Returns full string definition for message of type '<GetRange-response>"
  (cl:format cl:nil "bool success~%int16[] min~%int16[] max~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetRange-response)))
  "Returns full string definition for message of type 'GetRange-response"
  (cl:format cl:nil "bool success~%int16[] min~%int16[] max~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetRange-response>))
  (cl:+ 0
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'min) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'max) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetRange-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetRange-response
    (cl:cons ':success (success msg))
    (cl:cons ':min (min msg))
    (cl:cons ':max (max msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetRange)))
  'GetRange-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetRange)))
  'GetRange-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetRange)))
  "Returns string type for a service object of type '<GetRange>"
  "lab_config/GetRange")