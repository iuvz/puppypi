; Auto-generated. Do not edit!


(cl:in-package sensor-msg)


;//! \htmlinclude RGB.msg.html

(cl:defclass <RGB> (roslisp-msg-protocol:ros-message)
  ((r
    :reader r
    :initarg :r
    :type cl:fixnum
    :initform 0)
   (g
    :reader g
    :initarg :g
    :type cl:fixnum
    :initform 0)
   (b
    :reader b
    :initarg :b
    :type cl:fixnum
    :initform 0))
)

(cl:defclass RGB (<RGB>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RGB>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RGB)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor-msg:<RGB> is deprecated: use sensor-msg:RGB instead.")))

(cl:ensure-generic-function 'r-val :lambda-list '(m))
(cl:defmethod r-val ((m <RGB>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor-msg:r-val is deprecated.  Use sensor-msg:r instead.")
  (r m))

(cl:ensure-generic-function 'g-val :lambda-list '(m))
(cl:defmethod g-val ((m <RGB>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor-msg:g-val is deprecated.  Use sensor-msg:g instead.")
  (g m))

(cl:ensure-generic-function 'b-val :lambda-list '(m))
(cl:defmethod b-val ((m <RGB>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor-msg:b-val is deprecated.  Use sensor-msg:b instead.")
  (b m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RGB>) ostream)
  "Serializes a message object of type '<RGB>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RGB>) istream)
  "Deserializes a message object of type '<RGB>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'r)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'g)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'b)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RGB>)))
  "Returns string type for a message object of type '<RGB>"
  "sensor/RGB")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RGB)))
  "Returns string type for a message object of type 'RGB"
  "sensor/RGB")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RGB>)))
  "Returns md5sum for a message object of type '<RGB>"
  "353891e354491c51aabe32df673fb446")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RGB)))
  "Returns md5sum for a message object of type 'RGB"
  "353891e354491c51aabe32df673fb446")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RGB>)))
  "Returns full string definition for message of type '<RGB>"
  (cl:format cl:nil "uint8 r~%uint8 g~%uint8 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RGB)))
  "Returns full string definition for message of type 'RGB"
  (cl:format cl:nil "uint8 r~%uint8 g~%uint8 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RGB>))
  (cl:+ 0
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RGB>))
  "Converts a ROS message object to a list"
  (cl:list 'RGB
    (cl:cons ':r (r msg))
    (cl:cons ':g (g msg))
    (cl:cons ':b (b msg))
))
