// Auto-generated. Do not edit!

// (in-package lab_config.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetAllColorNameRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetAllColorNameRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetAllColorNameRequest
    let len;
    let data = new GetAllColorNameRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'lab_config/GetAllColorNameRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetAllColorNameRequest(null);
    return resolved;
    }
};

class GetAllColorNameResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.color_names = null;
    }
    else {
      if (initObj.hasOwnProperty('color_names')) {
        this.color_names = initObj.color_names
      }
      else {
        this.color_names = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetAllColorNameResponse
    // Serialize message field [color_names]
    bufferOffset = _arraySerializer.string(obj.color_names, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetAllColorNameResponse
    let len;
    let data = new GetAllColorNameResponse(null);
    // Deserialize message field [color_names]
    data.color_names = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.color_names.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'lab_config/GetAllColorNameResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '07eeaa0f3311bac2cbbe7fd861374c5c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] color_names
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetAllColorNameResponse(null);
    if (msg.color_names !== undefined) {
      resolved.color_names = msg.color_names;
    }
    else {
      resolved.color_names = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GetAllColorNameRequest,
  Response: GetAllColorNameResponse,
  md5sum() { return '07eeaa0f3311bac2cbbe7fd861374c5c'; },
  datatype() { return 'lab_config/GetAllColorName'; }
};
