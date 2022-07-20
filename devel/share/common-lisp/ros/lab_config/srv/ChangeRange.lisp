; Auto-generated. Do not edit!


(cl:in-package lab_config-srv)


;//! \htmlinclude ChangeRange-request.msg.html

(cl:defclass <ChangeRange-request> (roslisp-msg-protocol:ros-message)
  ((min
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

(cl:defclass ChangeRange-request (<ChangeRange-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeRange-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeRange-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lab_config-srv:<ChangeRange-request> is deprecated: use lab_config-srv:ChangeRange-request instead.")))

(cl:ensure-generic-function 'min-val :lambda-list '(m))
(cl:defmethod min-val ((m <ChangeRange-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab_config-srv:min-val is deprecated.  Use lab_config-srv:min instead.")
  (min m))

(cl:ensure-generic-function 'max-val :lambda-list '(m))
(cl:defmethod max-val ((m <ChangeRange-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab_config-srv:max-val is deprecated.  Use lab_config-srv:max instead.")
  (max m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeRange-request>) ostream)
  "Serializes a message object of type '<ChangeRange-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeRange-request>) istream)
  "Deserializes a message object of type '<ChangeRange-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeRange-request>)))
  "Returns string type for a service object of type '<ChangeRange-request>"
  "lab_config/ChangeRangeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeRange-request)))
  "Returns string type for a service object of type 'ChangeRange-request"
  "lab_config/ChangeRangeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeRange-request>)))
  "Returns md5sum for a message object of type '<ChangeRange-request>"
  "b6426602006389ecb4fb8d1c27273f68")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeRange-request)))
  "Returns md5sum for a message object of type 'ChangeRange-request"
  "b6426602006389ecb4fb8d1c27273f68")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeRange-request>)))
  "Returns full string definition for message of type '<ChangeRange-request>"
  (cl:format cl:nil "int16[] min~%int16[] max~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeRange-request)))
  "Returns full string definition for message of type 'ChangeRange-request"
  (cl:format cl:nil "int16[] min~%int16[] max~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeRange-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'min) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'max) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeRange-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeRange-request
    (cl:cons ':min (min msg))
    (cl:cons ':max (max msg))
))
;//! \htmlinclude ChangeRange-response.msg.html

(cl:defclass <ChangeRange-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass ChangeRange-response (<ChangeRange-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeRange-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeRange-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lab_config-srv:<ChangeRange-response> is deprecated: use lab_config-srv:ChangeRange-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ChangeRange-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab_config-srv:success-val is deprecated.  Use lab_config-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <ChangeRange-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab_config-srv:message-val is deprecated.  Use lab_config-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeRange-response>) ostream)
  "Serializes a message object of type '<ChangeRange-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeRange-response>) istream)
  "Deserializes a message object of type '<ChangeRange-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeRange-response>)))
  "Returns string type for a service object of type '<ChangeRange-response>"
  "lab_config/ChangeRangeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeRange-response)))
  "Returns string type for a service object of type 'ChangeRange-response"
  "lab_config/ChangeRangeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeRange-response>)))
  "Returns md5sum for a message object of type '<ChangeRange-response>"
  "b6426602006389ecb4fb8d1c27273f68")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeRange-response)))
  "Returns md5sum for a message object of type 'ChangeRange-response"
  "b6426602006389ecb4fb8d1c27273f68")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeRange-response>)))
  "Returns full string definition for message of type '<ChangeRange-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeRange-response)))
  "Returns full string definition for message of type 'ChangeRange-response"
  (cl:format cl:nil "bool success~%string message~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeRange-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeRange-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeRange-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ChangeRange)))
  'ChangeRange-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ChangeRange)))
  'ChangeRange-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeRange)))
  "Returns string type for a service object of type '<ChangeRange>"
  "lab_config/ChangeRange")