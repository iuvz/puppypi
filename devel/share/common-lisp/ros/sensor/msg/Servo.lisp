; Auto-generated. Do not edit!


(cl:in-package sensor-msg)


;//! \htmlinclude Servo.msg.html

(cl:defclass <Servo> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (pulse
    :reader pulse
    :initarg :pulse
    :type cl:integer
    :initform 0)
   (time
    :reader time
    :initarg :time
    :type cl:integer
    :initform 0))
)

(cl:defclass Servo (<Servo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Servo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Servo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor-msg:<Servo> is deprecated: use sensor-msg:Servo instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <Servo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor-msg:id-val is deprecated.  Use sensor-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'pulse-val :lambda-list '(m))
(cl:defmethod pulse-val ((m <Servo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor-msg:pulse-val is deprecated.  Use sensor-msg:pulse instead.")
  (pulse m))

(cl:ensure-generic-function 'time-val :lambda-list '(m))
(cl:defmethod time-val ((m <Servo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor-msg:time-val is deprecated.  Use sensor-msg:time instead.")
  (time m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Servo>) ostream)
  "Serializes a message object of type '<Servo>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'pulse)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'time)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Servo>) istream)
  "Deserializes a message object of type '<Servo>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'pulse) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'time) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Servo>)))
  "Returns string type for a message object of type '<Servo>"
  "sensor/Servo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Servo)))
  "Returns string type for a message object of type 'Servo"
  "sensor/Servo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Servo>)))
  "Returns md5sum for a message object of type '<Servo>"
  "27fba4c6dd04ddcfa19ba8394a1086e6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Servo)))
  "Returns md5sum for a message object of type 'Servo"
  "27fba4c6dd04ddcfa19ba8394a1086e6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Servo>)))
  "Returns full string definition for message of type '<Servo>"
  (cl:format cl:nil "int8 id~%int32 pulse~%int32 time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Servo)))
  "Returns full string definition for message of type 'Servo"
  (cl:format cl:nil "int8 id~%int32 pulse~%int32 time~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Servo>))
  (cl:+ 0
     1
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Servo>))
  "Converts a ROS message object to a list"
  (cl:list 'Servo
    (cl:cons ':id (id msg))
    (cl:cons ':pulse (pulse msg))
    (cl:cons ':time (time msg))
))
