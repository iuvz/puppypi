; Auto-generated. Do not edit!


(cl:in-package object_tracking-srv)


;//! \htmlinclude SetTarget-request.msg.html

(cl:defclass <SetTarget-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type cl:string
    :initform ""))
)

(cl:defclass SetTarget-request (<SetTarget-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetTarget-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetTarget-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name object_tracking-srv:<SetTarget-request> is deprecated: use object_tracking-srv:SetTarget-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <SetTarget-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_tracking-srv:data-val is deprecated.  Use object_tracking-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetTarget-request>) ostream)
  "Serializes a message object of type '<SetTarget-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetTarget-request>) istream)
  "Deserializes a message object of type '<SetTarget-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'data) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'data) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetTarget-request>)))
  "Returns string type for a service object of type '<SetTarget-request>"
  "object_tracking/SetTargetRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetTarget-request)))
  "Returns string type for a service object of type 'SetTarget-request"
  "object_tracking/SetTargetRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetTarget-request>)))
  "Returns md5sum for a message object of type '<SetTarget-request>"
  "546971982e3fbbd5a41e60fb6432e357")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetTarget-request)))
  "Returns md5sum for a message object of type 'SetTarget-request"
  "546971982e3fbbd5a41e60fb6432e357")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetTarget-request>)))
  "Returns full string definition for message of type '<SetTarget-request>"
  (cl:format cl:nil "string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetTarget-request)))
  "Returns full string definition for message of type 'SetTarget-request"
  (cl:format cl:nil "string data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetTarget-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'data))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetTarget-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetTarget-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude SetTarget-response.msg.html

(cl:defclass <SetTarget-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetTarget-response (<SetTarget-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetTarget-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetTarget-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name object_tracking-srv:<SetTarget-response> is deprecated: use object_tracking-srv:SetTarget-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetTarget-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_tracking-srv:success-val is deprecated.  Use object_tracking-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetTarget-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader object_tracking-srv:message-val is deprecated.  Use object_tracking-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetTarget-response>) ostream)
  "Serializes a message object of type '<SetTarget-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetTarget-response>) istream)
  "Deserializes a message object of type '<SetTarget-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetTarget-response>)))
  "Returns string type for a service object of type '<SetTarget-response>"
  "object_tracking/SetTargetResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetTarget-response)))
  "Returns string type for a service object of type 'SetTarget-response"
  "object_tracking/SetTargetResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetTarget-response>)))
  "Returns md5sum for a message object of type '<SetTarget-response>"
  "546971982e3fbbd5a41e60fb6432e357")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetTarget-response)))
  "Returns md5sum for a message object of type 'SetTarget-response"
  "546971982e3fbbd5a41e60fb6432e357")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetTarget-response>)))
  "Returns full string definition for message of type '<SetTarget-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetTarget-response)))
  "Returns full string definition for message of type 'SetTarget-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetTarget-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetTarget-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetTarget-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetTarget)))
  'SetTarget-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetTarget)))
  'SetTarget-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetTarget)))
  "Returns string type for a service object of type '<SetTarget>"
  "object_tracking/SetTarget")