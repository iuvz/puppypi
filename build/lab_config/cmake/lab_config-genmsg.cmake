# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "lab_config: 0 messages, 4 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(lab_config_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/ChangeRange.srv" NAME_WE)
add_custom_target(_lab_config_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lab_config" "/home/pi/puppy_pi/src/lab_config/srv/ChangeRange.srv" ""
)

get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/StashRange.srv" NAME_WE)
add_custom_target(_lab_config_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lab_config" "/home/pi/puppy_pi/src/lab_config/srv/StashRange.srv" ""
)

get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/GetRange.srv" NAME_WE)
add_custom_target(_lab_config_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lab_config" "/home/pi/puppy_pi/src/lab_config/srv/GetRange.srv" ""
)

get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/GetAllColorName.srv" NAME_WE)
add_custom_target(_lab_config_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lab_config" "/home/pi/puppy_pi/src/lab_config/srv/GetAllColorName.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/ChangeRange.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab_config
)
_generate_srv_cpp(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/StashRange.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab_config
)
_generate_srv_cpp(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/GetRange.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab_config
)
_generate_srv_cpp(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/GetAllColorName.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab_config
)

### Generating Module File
_generate_module_cpp(lab_config
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab_config
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(lab_config_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(lab_config_generate_messages lab_config_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/ChangeRange.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_cpp _lab_config_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/StashRange.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_cpp _lab_config_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/GetRange.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_cpp _lab_config_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/GetAllColorName.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_cpp _lab_config_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lab_config_gencpp)
add_dependencies(lab_config_gencpp lab_config_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lab_config_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/ChangeRange.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lab_config
)
_generate_srv_eus(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/StashRange.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lab_config
)
_generate_srv_eus(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/GetRange.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lab_config
)
_generate_srv_eus(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/GetAllColorName.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lab_config
)

### Generating Module File
_generate_module_eus(lab_config
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lab_config
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(lab_config_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(lab_config_generate_messages lab_config_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/ChangeRange.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_eus _lab_config_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/StashRange.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_eus _lab_config_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/GetRange.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_eus _lab_config_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/GetAllColorName.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_eus _lab_config_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lab_config_geneus)
add_dependencies(lab_config_geneus lab_config_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lab_config_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/ChangeRange.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab_config
)
_generate_srv_lisp(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/StashRange.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab_config
)
_generate_srv_lisp(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/GetRange.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab_config
)
_generate_srv_lisp(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/GetAllColorName.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab_config
)

### Generating Module File
_generate_module_lisp(lab_config
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab_config
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(lab_config_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(lab_config_generate_messages lab_config_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/ChangeRange.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_lisp _lab_config_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/StashRange.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_lisp _lab_config_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/GetRange.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_lisp _lab_config_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/GetAllColorName.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_lisp _lab_config_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lab_config_genlisp)
add_dependencies(lab_config_genlisp lab_config_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lab_config_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/ChangeRange.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lab_config
)
_generate_srv_nodejs(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/StashRange.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lab_config
)
_generate_srv_nodejs(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/GetRange.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lab_config
)
_generate_srv_nodejs(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/GetAllColorName.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lab_config
)

### Generating Module File
_generate_module_nodejs(lab_config
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lab_config
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(lab_config_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(lab_config_generate_messages lab_config_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/ChangeRange.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_nodejs _lab_config_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/StashRange.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_nodejs _lab_config_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/GetRange.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_nodejs _lab_config_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/GetAllColorName.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_nodejs _lab_config_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lab_config_gennodejs)
add_dependencies(lab_config_gennodejs lab_config_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lab_config_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/ChangeRange.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab_config
)
_generate_srv_py(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/StashRange.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab_config
)
_generate_srv_py(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/GetRange.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab_config
)
_generate_srv_py(lab_config
  "/home/pi/puppy_pi/src/lab_config/srv/GetAllColorName.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab_config
)

### Generating Module File
_generate_module_py(lab_config
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab_config
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(lab_config_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(lab_config_generate_messages lab_config_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/ChangeRange.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_py _lab_config_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/StashRange.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_py _lab_config_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/GetRange.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_py _lab_config_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/pi/puppy_pi/src/lab_config/srv/GetAllColorName.srv" NAME_WE)
add_dependencies(lab_config_generate_messages_py _lab_config_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lab_config_genpy)
add_dependencies(lab_config_genpy lab_config_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lab_config_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab_config)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lab_config
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(lab_config_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lab_config)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lab_config
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(lab_config_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab_config)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lab_config
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(lab_config_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lab_config)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lab_config
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(lab_config_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab_config)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab_config\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lab_config
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(lab_config_generate_messages_py std_msgs_generate_messages_py)
endif()
