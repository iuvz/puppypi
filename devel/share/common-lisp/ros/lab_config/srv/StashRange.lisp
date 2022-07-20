; Auto-generated. Do not edit!


(cl:in-package lab_config-srv)


;//! \htmlinclude StashRange-request.msg.html

(cl:defclass <StashRange-request> (roslisp-msg-protocol:ros-message)
  ((color_name
    :reader color_name
    :initarg :color_name
    :type cl:string
    :initform ""))
)

(cl:defclass StashRange-request (<StashRange-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StashRange-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StashRange-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lab_config-srv:<StashRange-request> is deprecated: use lab_config-srv:StashRange-request instead.")))

(cl:ensure-generic-function 'color_name-val :lambda-list '(m))
(cl:defmethod color_name-val ((m <StashRange-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab_config-srv:color_name-val is deprecated.  Use lab_config-srv:color_name instead.")
  (color_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StashRange-request>) ostream)
  "Serializes a message object of type '<StashRange-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'color_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'color_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StashRange-request>) istream)
  "Deserializes a message object of type '<StashRange-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StashRange-request>)))
  "Returns string type for a service object of type '<StashRange-request>"
  "lab_config/StashRangeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StashRange-request)))
  "Returns string type for a service object of type 'StashRange-request"
  "lab_config/StashRangeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StashRange-request>)))
  "Returns md5sum for a message object of type '<StashRange-request>"
  "b043027b67620a7221fbfd7733360ab7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StashRange-request)))
  "Returns md5sum for a message object of type 'StashRange-request"
  "b043027b67620a7221fbfd7733360ab7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StashRange-request>)))
  "Returns full string definition for message of type '<StashRange-request>"
  (cl:format cl:nil "string color_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StashRange-request)))
  "Returns full string definition for message of type 'StashRange-request"
  (cl:format cl:nil "string color_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StashRange-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'color_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StashRange-request>))
  "Converts a ROS message object to a list"
  (cl:list 'StashRange-request
    (cl:cons ':color_name (color_name msg))
))
;//! \htmlinclude StashRange-response.msg.html

(cl:defclass <StashRange-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass StashRange-response (<StashRange-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StashRange-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StashRange-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lab_config-srv:<StashRange-response> is deprecated: use lab_config-srv:StashRange-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <StashRange-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab_config-srv:success-val is deprecated.  Use lab_config-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <StashRange-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lab_config-srv:message-val is deprecated.  Use lab_config-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StashRange-response>) ostream)
  "Serializes a message object of type '<StashRange-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StashRange-response>) istream)
  "Deserializes a message object of type '<StashRange-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StashRange-response>)))
  "Returns string type for a service object of type '<StashRange-response>"
  "lab_config/StashRangeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StashRange-response)))
  "Returns string type for a service object of type 'StashRange-response"
  "lab_config/StashRangeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StashRange-response>)))
  "Returns md5sum for a message object of type '<StashRange-response>"
  "b043027b67620a7221fbfd7733360ab7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StashRange-response)))
  "Returns md5sum for a message object of type 'StashRange-response"
  "b043027b67620a7221fbfd7733360ab7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StashRange-response>)))
  "Returns full string definition for message of type '<StashRange-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StashRange-response)))
  "Returns full string definition for message of type 'StashRange-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StashRange-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StashRange-response>))
  "Converts a ROS message object to a list"
  (cl:list 'StashRange-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'StashRange)))
  'StashRange-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'StashRange)))
  'StashRange-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StashRange)))
  "Returns string type for a service object of type '<StashRange>"
  "lab_config/StashRange")