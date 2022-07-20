; Auto-generated. Do not edit!


(cl:in-package sensor-msg)


;//! \htmlinclude Led.msg.html

(cl:defclass <Led> (roslisp-msg-protocol:ros-message)
  ((index
    :reader index
    :initarg :index
    :type cl:fixnum
    :initform 0)
   (rgb
    :reader rgb
    :initarg :rgb
    :type sensor-msg:RGB
    :initform (cl:make-instance 'sensor-msg:RGB)))
)

(cl:defclass Led (<Led>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Led>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Led)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor-msg:<Led> is deprecated: use sensor-msg:Led instead.")))

(cl:ensure-generic-function 'index-val :lambda-list '(m))
(cl:defmethod index-val ((m <Led>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor-msg:index-val is deprecated.  Use sensor-msg:index instead.")
  (index m))

(cl:ensure-generic-function 'rgb-val :lambda-list '(m))
(cl:defmethod rgb-val ((m <Led>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor-msg:rgb-val is deprecated.  Use sensor-msg:rgb instead.")
  (rgb m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Led>) ostream)
  "Serializes a message object of type '<Led>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'index)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rgb) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Led>) istream)
  "Deserializes a message object of type '<Led>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'index)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rgb) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Led>)))
  "Returns string type for a message object of type '<Led>"
  "sensor/Led")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Led)))
  "Returns string type for a message object of type 'Led"
  "sensor/Led")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Led>)))
  "Returns md5sum for a message object of type '<Led>"
  "30e1b14f90ea917fa794eb562e3a6723")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Led)))
  "Returns md5sum for a message object of type 'Led"
  "30e1b14f90ea917fa794eb562e3a6723")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Led>)))
  "Returns full string definition for message of type '<Led>"
  (cl:format cl:nil "uint8 index~%sensor/RGB rgb~%~%================================================================================~%MSG: sensor/RGB~%uint8 r~%uint8 g~%uint8 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Led)))
  "Returns full string definition for message of type 'Led"
  (cl:format cl:nil "uint8 index~%sensor/RGB rgb~%~%================================================================================~%MSG: sensor/RGB~%uint8 r~%uint8 g~%uint8 b~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Led>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rgb))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Led>))
  "Converts a ROS message object to a list"
  (cl:list 'Led
    (cl:cons ':index (index msg))
    (cl:cons ':rgb (rgb msg))
))
