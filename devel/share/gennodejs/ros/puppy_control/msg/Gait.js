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

class Gait {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.overlap_time = null;
      this.swing_time = null;
      this.clearance_time = null;
      this.z_clearance = null;
    }
    else {
      if (initObj.hasOwnProperty('overlap_time')) {
        this.overlap_time = initObj.overlap_time
      }
      else {
        this.overlap_time = 0.0;
      }
      if (initObj.hasOwnProperty('swing_time')) {
        this.swing_time = initObj.swing_time
      }
      else {
        this.swing_time = 0.0;
      }
      if (initObj.hasOwnProperty('clearance_time')) {
        this.clearance_time = initObj.clearance_time
      }
      else {
        this.clearance_time = 0.0;
      }
      if (initObj.hasOwnProperty('z_clearance')) {
        this.z_clearance = initObj.z_clearance
      }
      else {
        this.z_clearance = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Gait
    // Serialize message field [overlap_time]
    bufferOffset = _serializer.float32(obj.overlap_time, buffer, bufferOffset);
    // Serialize message field [swing_time]
    bufferOffset = _serializer.float32(obj.swing_time, buffer, bufferOffset);
    // Serialize message field [clearance_time]
    bufferOffset = _serializer.float32(obj.clearance_time, buffer, bufferOffset);
    // Serialize message field [z_clearance]
    bufferOffset = _serializer.float32(obj.z_clearance, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Gait
    let len;
    let data = new Gait(null);
    // Deserialize message field [overlap_time]
    data.overlap_time = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [swing_time]
    data.swing_time = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [clearance_time]
    data.clearance_time = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [z_clearance]
    data.z_clearance = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'puppy_control/Gait';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '85570b63b58df2eb52f0cdc5f4a30db8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 overlap_time
    float32 swing_time
    float32 clearance_time
    float32 z_clearance
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Gait(null);
    if (msg.overlap_time !== undefined) {
      resolved.overlap_time = msg.overlap_time;
    }
    else {
      resolved.overlap_time = 0.0
    }

    if (msg.swing_time !== undefined) {
      resolved.swing_time = msg.swing_time;
    }
    else {
      resolved.swing_time = 0.0
    }

    if (msg.clearance_time !== undefined) {
      resolved.clearance_time = msg.clearance_time;
    }
    else {
      resolved.clearance_time = 0.0
    }

    if (msg.z_clearance !== undefined) {
      resolved.z_clearance = msg.z_clearance;
    }
    else {
      resolved.z_clearance = 0.0
    }

    return resolved;
    }
};

module.exports = Gait;
