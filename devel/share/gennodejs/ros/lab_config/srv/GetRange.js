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

class GetRangeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.color_name = null;
    }
    else {
      if (initObj.hasOwnProperty('color_name')) {
        this.color_name = initObj.color_name
      }
      else {
        this.color_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetRangeRequest
    // Serialize message field [color_name]
    bufferOffset = _serializer.string(obj.color_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetRangeRequest
    let len;
    let data = new GetRangeRequest(null);
    // Deserialize message field [color_name]
    data.color_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.color_name);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'lab_config/GetRangeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c1ebd3bdb7f211ac2ddd328c08dba1e4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string color_name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetRangeRequest(null);
    if (msg.color_name !== undefined) {
      resolved.color_name = msg.color_name;
    }
    else {
      resolved.color_name = ''
    }

    return resolved;
    }
};

class GetRangeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.min = null;
      this.max = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('min')) {
        this.min = initObj.min
      }
      else {
        this.min = [];
      }
      if (initObj.hasOwnProperty('max')) {
        this.max = initObj.max
      }
      else {
        this.max = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetRangeResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [min]
    bufferOffset = _arraySerializer.int16(obj.min, buffer, bufferOffset, null);
    // Serialize message field [max]
    bufferOffset = _arraySerializer.int16(obj.max, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetRangeResponse
    let len;
    let data = new GetRangeResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [min]
    data.min = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [max]
    data.max = _arrayDeserializer.int16(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 2 * object.min.length;
    length += 2 * object.max.length;
    return length + 9;
  }

  static datatype() {
    // Returns string type for a service object
    return 'lab_config/GetRangeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd599c1159c0ce143f7e9828a688b9c8f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    int16[] min
    int16[] max
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetRangeResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.min !== undefined) {
      resolved.min = msg.min;
    }
    else {
      resolved.min = []
    }

    if (msg.max !== undefined) {
      resolved.max = msg.max;
    }
    else {
      resolved.max = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GetRangeRequest,
  Response: GetRangeResponse,
  md5sum() { return 'c7b2c33b1c9c860ea4b8bdc266a1aed8'; },
  datatype() { return 'lab_config/GetRange'; }
};
