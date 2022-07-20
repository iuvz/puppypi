; Auto-generated. Do not edit!


(cl:in-package puppy_control-srv)


;//! \htmlinclude SetRunActionName-request.msg.html

(cl:defclass <SetRunActionName-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform "")
   (wait
    :reader wait
    :initarg :wait
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetRunActionName-request (<SetRunActionName-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetRunActionName-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetRunActionName-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name puppy_control-srv:<SetRunActionName-request> is deprecated: use puppy_control-srv:SetRunActionName-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <SetRunActionName-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader puppy_control-srv:name-val is deprecated.  Use puppy_control-srv:name instead.")
  (name m))

(cl:ensure-generic-function 'wait-val :lambda-list '(m))
(cl:defmethod wait-val ((m <SetRunActionName-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader puppy_control-srv:wait-val is deprecated.  Use puppy_control-srv:wait instead.")
  (wait m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetRunActionName-request>) ostream)
  "Serializes a message object of type '<SetRunActionName-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'wait) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetRunActionName-request>) istream)
  "Deserializes a message object of type '<SetRunActionName-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'wait) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetRunActionName-request>)))
  "Returns string type for a service object of type '<SetRunActionName-request>"
  "puppy_control/SetRunActionNameRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetRunActionName-request)))
  "Returns string type for a service object of type 'SetRunActionName-request"
  "puppy_control/SetRunActionNameRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetRunActionName-request>)))
  "Returns md5sum for a message object of type '<SetRunActionName-request>"
  "b7336d7e4c3e9d0199fd9c319d9a619a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetRunActionName-request)))
  "Returns md5sum for a message object of type 'SetRunActionName-request"
  "b7336d7e4c3e9d0199fd9c319d9a619a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetRunActionName-request>)))
  "Returns full string definition for message of type '<SetRunActionName-request>"
  (cl:format cl:nil "string name~%bool wait~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetRunActionName-request)))
  "Returns full string definition for message of type 'SetRunActionName-request"
  (cl:format cl:nil "string name~%bool wait~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetRunActionName-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetRunActionName-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetRunActionName-request
    (cl:cons ':name (name msg))
    (cl:cons ':wait (wait msg))
))
;//! \htmlinclude SetRunActionName-response.msg.html

(cl:defclass <SetRunActionName-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass SetRunActionName-response (<SetRunActionName-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetRunActionName-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetRunActionName-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name puppy_control-srv:<SetRunActionName-response> is deprecated: use puppy_control-srv:SetRunActionName-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetRunActionName-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader puppy_control-srv:success-val is deprecated.  Use puppy_control-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <SetRunActionName-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader puppy_control-srv:message-val is deprecated.  Use puppy_control-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetRunActionName-response>) ostream)
  "Serializes a message object of type '<SetRunActionName-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetRunActionName-response>) istream)
  "Deserializes a message object of type '<SetRunActionName-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetRunActionName-response>)))
  "Returns string type for a service object of type '<SetRunActionName-response>"
  "puppy_control/SetRunActionNameResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetRunActionName-response)))
  "Returns string type for a service object of type 'SetRunActionName-response"
  "puppy_control/SetRunActionNameResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetRunActionName-response>)))
  "Returns md5sum for a message object of type '<SetRunActionName-response>"
  "b7336d7e4c3e9d0199fd9c319d9a619a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetRunActionName-response)))
  "Returns md5sum for a message object of type 'SetRunActionName-response"
  "b7336d7e4c3e9d0199fd9c319d9a619a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetRunActionName-response>)))
  "Returns full string definition for message of type '<SetRunActionName-response>"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetRunActionName-response)))
  "Returns full string definition for message of type 'SetRunActionName-response"
  (cl:format cl:nil "bool success~%string message~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetRunActionName-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetRunActionName-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetRunActionName-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetRunActionName)))
  'SetRunActionName-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetRunActionName)))
  'SetRunActionName-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetRunActionName)))
  "Returns string type for a service object of type '<SetRunActionName>"
  "puppy_control/SetRunActionName")