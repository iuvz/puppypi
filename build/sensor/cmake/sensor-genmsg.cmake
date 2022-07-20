# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "sensor: 4 messages, 0 services")

set(MSG_I_FLAGS "-Isensor:/home/pi/puppy_pi/src/sensor/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(sensor_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/RGB.msg" NAME_WE)
add_custom_target(_sensor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor" "/home/pi/puppy_pi/src/sensor/msg/RGB.msg" ""
)

get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Led.msg" NAME_WE)
add_custom_target(_sensor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor" "/home/pi/puppy_pi/src/sensor/msg/Led.msg" "sensor/RGB"
)

get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Motor.msg" NAME_WE)
add_custom_target(_sensor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor" "/home/pi/puppy_pi/src/sensor/msg/Motor.msg" ""
)

get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Servo.msg" NAME_WE)
add_custom_target(_sensor_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "sensor" "/home/pi/puppy_pi/src/sensor/msg/Servo.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(sensor
  "/home/pi/puppy_pi/src/sensor/msg/RGB.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor
)
_generate_msg_cpp(sensor
  "/home/pi/puppy_pi/src/sensor/msg/Led.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/puppy_pi/src/sensor/msg/RGB.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor
)
_generate_msg_cpp(sensor
  "/home/pi/puppy_pi/src/sensor/msg/Motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor
)
_generate_msg_cpp(sensor
  "/home/pi/puppy_pi/src/sensor/msg/Servo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor
)

### Generating Services

### Generating Module File
_generate_module_cpp(sensor
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(sensor_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(sensor_generate_messages sensor_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/RGB.msg" NAME_WE)
add_dependencies(sensor_generate_messages_cpp _sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Led.msg" NAME_WE)
add_dependencies(sensor_generate_messages_cpp _sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Motor.msg" NAME_WE)
add_dependencies(sensor_generate_messages_cpp _sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Servo.msg" NAME_WE)
add_dependencies(sensor_generate_messages_cpp _sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_gencpp)
add_dependencies(sensor_gencpp sensor_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(sensor
  "/home/pi/puppy_pi/src/sensor/msg/RGB.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor
)
_generate_msg_eus(sensor
  "/home/pi/puppy_pi/src/sensor/msg/Led.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/puppy_pi/src/sensor/msg/RGB.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor
)
_generate_msg_eus(sensor
  "/home/pi/puppy_pi/src/sensor/msg/Motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor
)
_generate_msg_eus(sensor
  "/home/pi/puppy_pi/src/sensor/msg/Servo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor
)

### Generating Services

### Generating Module File
_generate_module_eus(sensor
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(sensor_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(sensor_generate_messages sensor_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/RGB.msg" NAME_WE)
add_dependencies(sensor_generate_messages_eus _sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Led.msg" NAME_WE)
add_dependencies(sensor_generate_messages_eus _sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Motor.msg" NAME_WE)
add_dependencies(sensor_generate_messages_eus _sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Servo.msg" NAME_WE)
add_dependencies(sensor_generate_messages_eus _sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_geneus)
add_dependencies(sensor_geneus sensor_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(sensor
  "/home/pi/puppy_pi/src/sensor/msg/RGB.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor
)
_generate_msg_lisp(sensor
  "/home/pi/puppy_pi/src/sensor/msg/Led.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/puppy_pi/src/sensor/msg/RGB.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor
)
_generate_msg_lisp(sensor
  "/home/pi/puppy_pi/src/sensor/msg/Motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor
)
_generate_msg_lisp(sensor
  "/home/pi/puppy_pi/src/sensor/msg/Servo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor
)

### Generating Services

### Generating Module File
_generate_module_lisp(sensor
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(sensor_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(sensor_generate_messages sensor_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/RGB.msg" NAME_WE)
add_dependencies(sensor_generate_messages_lisp _sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Led.msg" NAME_WE)
add_dependencies(sensor_generate_messages_lisp _sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Motor.msg" NAME_WE)
add_dependencies(sensor_generate_messages_lisp _sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Servo.msg" NAME_WE)
add_dependencies(sensor_generate_messages_lisp _sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_genlisp)
add_dependencies(sensor_genlisp sensor_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(sensor
  "/home/pi/puppy_pi/src/sensor/msg/RGB.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor
)
_generate_msg_nodejs(sensor
  "/home/pi/puppy_pi/src/sensor/msg/Led.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/puppy_pi/src/sensor/msg/RGB.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor
)
_generate_msg_nodejs(sensor
  "/home/pi/puppy_pi/src/sensor/msg/Motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor
)
_generate_msg_nodejs(sensor
  "/home/pi/puppy_pi/src/sensor/msg/Servo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor
)

### Generating Services

### Generating Module File
_generate_module_nodejs(sensor
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(sensor_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(sensor_generate_messages sensor_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/RGB.msg" NAME_WE)
add_dependencies(sensor_generate_messages_nodejs _sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Led.msg" NAME_WE)
add_dependencies(sensor_generate_messages_nodejs _sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Motor.msg" NAME_WE)
add_dependencies(sensor_generate_messages_nodejs _sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Servo.msg" NAME_WE)
add_dependencies(sensor_generate_messages_nodejs _sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_gennodejs)
add_dependencies(sensor_gennodejs sensor_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(sensor
  "/home/pi/puppy_pi/src/sensor/msg/RGB.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor
)
_generate_msg_py(sensor
  "/home/pi/puppy_pi/src/sensor/msg/Led.msg"
  "${MSG_I_FLAGS}"
  "/home/pi/puppy_pi/src/sensor/msg/RGB.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor
)
_generate_msg_py(sensor
  "/home/pi/puppy_pi/src/sensor/msg/Motor.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor
)
_generate_msg_py(sensor
  "/home/pi/puppy_pi/src/sensor/msg/Servo.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor
)

### Generating Services

### Generating Module File
_generate_module_py(sensor
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(sensor_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(sensor_generate_messages sensor_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/RGB.msg" NAME_WE)
add_dependencies(sensor_generate_messages_py _sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Led.msg" NAME_WE)
add_dependencies(sensor_generate_messages_py _sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Motor.msg" NAME_WE)
add_dependencies(sensor_generate_messages_py _sensor_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/sensor/msg/Servo.msg" NAME_WE)
add_dependencies(sensor_generate_messages_py _sensor_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(sensor_genpy)
add_dependencies(sensor_genpy sensor_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS sensor_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/sensor
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(sensor_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/sensor
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(sensor_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/sensor
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(sensor_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/sensor
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(sensor_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/sensor
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(sensor_generate_messages_py std_msgs_generate_messages_py)
endif()
