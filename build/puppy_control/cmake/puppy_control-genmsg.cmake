# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "puppy_control: 3 messages, 1 services")

set(MSG_I_FLAGS "-Ipuppy_control:/home/pi/puppy_pi/src/puppy_control/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(puppy_control_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Pose.msg" NAME_WE)
add_custom_target(_puppy_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "puppy_control" "/home/pi/puppy_pi/src/puppy_control/msg/Pose.msg" ""
)

get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Velocity.msg" NAME_WE)
add_custom_target(_puppy_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "puppy_control" "/home/pi/puppy_pi/src/puppy_control/msg/Velocity.msg" ""
)

get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Gait.msg" NAME_WE)
add_custom_target(_puppy_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "puppy_control" "/home/pi/puppy_pi/src/puppy_control/msg/Gait.msg" ""
)

get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/srv/SetRunActionName.srv" NAME_WE)
add_custom_target(_puppy_control_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "puppy_control" "/home/pi/puppy_pi/src/puppy_control/srv/SetRunActionName.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/msg/Pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/puppy_control
)
_generate_msg_cpp(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/msg/Velocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/puppy_control
)
_generate_msg_cpp(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/msg/Gait.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/puppy_control
)

### Generating Services
_generate_srv_cpp(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/srv/SetRunActionName.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/puppy_control
)

### Generating Module File
_generate_module_cpp(puppy_control
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/puppy_control
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(puppy_control_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(puppy_control_generate_messages puppy_control_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Pose.msg" NAME_WE)
add_dependencies(puppy_control_generate_messages_cpp _puppy_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Velocity.msg" NAME_WE)
add_dependencies(puppy_control_generate_messages_cpp _puppy_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Gait.msg" NAME_WE)
add_dependencies(puppy_control_generate_messages_cpp _puppy_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/srv/SetRunActionName.srv" NAME_WE)
add_dependencies(puppy_control_generate_messages_cpp _puppy_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(puppy_control_gencpp)
add_dependencies(puppy_control_gencpp puppy_control_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS puppy_control_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/msg/Pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/puppy_control
)
_generate_msg_eus(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/msg/Velocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/puppy_control
)
_generate_msg_eus(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/msg/Gait.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/puppy_control
)

### Generating Services
_generate_srv_eus(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/srv/SetRunActionName.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/puppy_control
)

### Generating Module File
_generate_module_eus(puppy_control
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/puppy_control
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(puppy_control_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(puppy_control_generate_messages puppy_control_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Pose.msg" NAME_WE)
add_dependencies(puppy_control_generate_messages_eus _puppy_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Velocity.msg" NAME_WE)
add_dependencies(puppy_control_generate_messages_eus _puppy_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Gait.msg" NAME_WE)
add_dependencies(puppy_control_generate_messages_eus _puppy_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/srv/SetRunActionName.srv" NAME_WE)
add_dependencies(puppy_control_generate_messages_eus _puppy_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(puppy_control_geneus)
add_dependencies(puppy_control_geneus puppy_control_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS puppy_control_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/msg/Pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/puppy_control
)
_generate_msg_lisp(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/msg/Velocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/puppy_control
)
_generate_msg_lisp(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/msg/Gait.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/puppy_control
)

### Generating Services
_generate_srv_lisp(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/srv/SetRunActionName.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/puppy_control
)

### Generating Module File
_generate_module_lisp(puppy_control
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/puppy_control
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(puppy_control_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(puppy_control_generate_messages puppy_control_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Pose.msg" NAME_WE)
add_dependencies(puppy_control_generate_messages_lisp _puppy_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Velocity.msg" NAME_WE)
add_dependencies(puppy_control_generate_messages_lisp _puppy_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Gait.msg" NAME_WE)
add_dependencies(puppy_control_generate_messages_lisp _puppy_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/srv/SetRunActionName.srv" NAME_WE)
add_dependencies(puppy_control_generate_messages_lisp _puppy_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(puppy_control_genlisp)
add_dependencies(puppy_control_genlisp puppy_control_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS puppy_control_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/msg/Pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/puppy_control
)
_generate_msg_nodejs(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/msg/Velocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/puppy_control
)
_generate_msg_nodejs(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/msg/Gait.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/puppy_control
)

### Generating Services
_generate_srv_nodejs(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/srv/SetRunActionName.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/puppy_control
)

### Generating Module File
_generate_module_nodejs(puppy_control
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/puppy_control
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(puppy_control_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(puppy_control_generate_messages puppy_control_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Pose.msg" NAME_WE)
add_dependencies(puppy_control_generate_messages_nodejs _puppy_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Velocity.msg" NAME_WE)
add_dependencies(puppy_control_generate_messages_nodejs _puppy_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Gait.msg" NAME_WE)
add_dependencies(puppy_control_generate_messages_nodejs _puppy_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/srv/SetRunActionName.srv" NAME_WE)
add_dependencies(puppy_control_generate_messages_nodejs _puppy_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(puppy_control_gennodejs)
add_dependencies(puppy_control_gennodejs puppy_control_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS puppy_control_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/msg/Pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/puppy_control
)
_generate_msg_py(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/msg/Velocity.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/puppy_control
)
_generate_msg_py(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/msg/Gait.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/puppy_control
)

### Generating Services
_generate_srv_py(puppy_control
  "/home/pi/puppy_pi/src/puppy_control/srv/SetRunActionName.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/puppy_control
)

### Generating Module File
_generate_module_py(puppy_control
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/puppy_control
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(puppy_control_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(puppy_control_generate_messages puppy_control_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Pose.msg" NAME_WE)
add_dependencies(puppy_control_generate_messages_py _puppy_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Velocity.msg" NAME_WE)
add_dependencies(puppy_control_generate_messages_py _puppy_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/msg/Gait.msg" NAME_WE)
add_dependencies(puppy_control_generate_messages_py _puppy_control_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/puppy_control/srv/SetRunActionName.srv" NAME_WE)
add_dependencies(puppy_control_generate_messages_py _puppy_control_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(puppy_control_genpy)
add_dependencies(puppy_control_genpy puppy_control_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS puppy_control_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/puppy_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/puppy_control
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(puppy_control_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET std_srvs_generate_messages_cpp)
  add_dependencies(puppy_control_generate_messages_cpp std_srvs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/puppy_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/puppy_control
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(puppy_control_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET std_srvs_generate_messages_eus)
  add_dependencies(puppy_control_generate_messages_eus std_srvs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/puppy_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/puppy_control
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(puppy_control_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET std_srvs_generate_messages_lisp)
  add_dependencies(puppy_control_generate_messages_lisp std_srvs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/puppy_control)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/puppy_control
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(puppy_control_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET std_srvs_generate_messages_nodejs)
  add_dependencies(puppy_control_generate_messages_nodejs std_srvs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/puppy_control)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/puppy_control\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/puppy_control
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(puppy_control_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET std_srvs_generate_messages_py)
  add_dependencies(puppy_control_generate_messages_py std_srvs_generate_messages_py)
endif()
