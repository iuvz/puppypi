// Auto-generated. Do not edit!

// (in-package puppy_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Pose {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.roll = null;
      this.pitch = null;
      this.yaw = null;
      this.height = null;
      this.x_shift = null;
      this.stance_x = null;
      this.stance_y = null;
      this.run_time = null;
    }
    else {
      if (initObj.hasOwnProperty('roll')) {
        this.roll = initObj.roll
      }
      else {
        this.roll = 0.0;
      }
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
      if (initObj.hasOwnProperty('x_shift')) {
        this.x_shift = initObj.x_shift
      }
      else {
        this.x_shift = 0.0;
      }
      if (initObj.hasOwnProperty('stance_x')) {
        this.stance_x = initObj.stance_x
      }
      else {
        this.stance_x = 0.0;
      }
      if (initObj.hasOwnProperty('stance_y')) {
        this.stance_y = initObj.stance_y
      }
      else {
        this.stance_y = 0.0;
      }
      if (initObj.hasOwnProperty('run_time')) {
        this.run_time = initObj.run_time
      }
      else {
        this.run_time = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Pose
    // Serialize message field [roll]
    bufferOffset = _serializer.float32(obj.roll, buffer, bufferOffset);
    // Serialize message field [pitch]
    bufferOffset = _serializer.float32(obj.pitch, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float32(obj.yaw, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float32(obj.height, buffer, bufferOffset);
    // Serialize message field [x_shift]
    bufferOffset = _serializer.float32(obj.x_shift, buffer, bufferOffset);
    // Serialize message field [stance_x]
    bufferOffset = _serializer.float32(obj.stance_x, buffer, bufferOffset);
    // Serialize message field [stance_y]
    bufferOffset = _serializer.float32(obj.stance_y, buffer, bufferOffset);
    // Serialize message field [run_time]
    bufferOffset = _serializer.int32(obj.run_time, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Pose
    let len;
    let data = new Pose(null);
    // Deserialize message field [roll]
    data.roll = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [x_shift]
    data.x_shift = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [stance_x]
    data.stance_x = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [stance_y]
    data.stance_y = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [run_time]
    data.run_time = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'puppy_control/Pose';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'baecb41f8598067f3a25cfb12cfeb74d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 roll
    float32 pitch
    float32 yaw
    float32 height
    float32 x_shift
    float32 stance_x
    float32 stance_y
    
    int32 run_time
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Pose(null);
    if (msg.roll !== undefined) {
      resolved.roll = msg.roll;
    }
    else {
      resolved.roll = 0.0
    }

    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    if (msg.x_shift !== undefined) {
      resolved.x_shift = msg.x_shift;
    }
    else {
      resolved.x_shift = 0.0
    }

    if (msg.stance_x !== undefined) {
      resolved.stance_x = msg.stance_x;
    }
    else {
      resolved.stance_x = 0.0
    }

    if (msg.stance_y !== undefined) {
      resolved.stance_y = msg.stance_y;
    }
    else {
      resolved.stance_y = 0.0
    }

    if (msg.run_time !== undefined) {
      resolved.run_time = msg.run_time;
    }
    else {
      resolved.run_time = 0
    }

    return resolved;
    }
};

module.exports = Pose;
