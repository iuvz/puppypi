; Auto-generated. Do not edit!


(cl:in-package puppy_control-msg)


;//! \htmlinclude Gait.msg.html

(cl:defclass <Gait> (roslisp-msg-protocol:ros-message)
  ((overlap_time
    :reader overlap_time
    :initarg :overlap_time
    :type cl:float
    :initform 0.0)
   (swing_time
    :reader swing_time
    :initarg :swing_time
    :type cl:float
    :initform 0.0)
   (clearance_time
    :reader clearance_time
    :initarg :clearance_time
    :type cl:float
    :initform 0.0)
   (z_clearance
    :reader z_clearance
    :initarg :z_clearance
    :type cl:float
    :initform 0.0))
)

(cl:defclass Gait (<Gait>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Gait>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Gait)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name puppy_control-msg:<Gait> is deprecated: use puppy_control-msg:Gait instead.")))

(cl:ensure-generic-function 'overlap_time-val :lambda-list '(m))
(cl:defmethod overlap_time-val ((m <Gait>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader puppy_control-msg:overlap_time-val is deprecated.  Use puppy_control-msg:overlap_time instead.")
  (overlap_time m))

(cl:ensure-generic-function 'swing_time-val :lambda-list '(m))
(cl:defmethod swing_time-val ((m <Gait>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader puppy_control-msg:swing_time-val is deprecated.  Use puppy_control-msg:swing_time instead.")
  (swing_time m))

(cl:ensure-generic-function 'clearance_time-val :lambda-list '(m))
(cl:defmethod clearance_time-val ((m <Gait>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader puppy_control-msg:clearance_time-val is deprecated.  Use puppy_control-msg:clearance_time instead.")
  (clearance_time m))

(cl:ensure-generic-function 'z_clearance-val :lambda-list '(m))
(cl:defmethod z_clearance-val ((m <Gait>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader puppy_control-msg:z_clearance-val is deprecated.  Use puppy_control-msg:z_clearance instead.")
  (z_clearance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Gait>) ostream)
  "Serializes a message object of type '<Gait>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'overlap_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'swing_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'clearance_time))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z_clearance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Gait>) istream)
  "Deserializes a message object of type '<Gait>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'overlap_time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'swing_time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'clearance_time) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z_clearance) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Gait>)))
  "Returns string type for a message object of type '<Gait>"
  "puppy_control/Gait")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Gait)))
  "Returns string type for a message object of type 'Gait"
  "puppy_control/Gait")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Gait>)))
  "Returns md5sum for a message object of type '<Gait>"
  "85570b63b58df2eb52f0cdc5f4a30db8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Gait)))
  "Returns md5sum for a message object of type 'Gait"
  "85570b63b58df2eb52f0cdc5f4a30db8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Gait>)))
  "Returns full string definition for message of type '<Gait>"
  (cl:format cl:nil "float32 overlap_time~%float32 swing_time~%float32 clearance_time~%float32 z_clearance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Gait)))
  "Returns full string definition for message of type 'Gait"
  (cl:format cl:nil "float32 overlap_time~%float32 swing_time~%float32 clearance_time~%float32 z_clearance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Gait>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Gait>))
  "Converts a ROS message object to a list"
  (cl:list 'Gait
    (cl:cons ':overlap_time (overlap_time msg))
    (cl:cons ':swing_time (swing_time msg))
    (cl:cons ':clearance_time (clearance_time msg))
    (cl:cons ':z_clearance (z_clearance msg))
))
