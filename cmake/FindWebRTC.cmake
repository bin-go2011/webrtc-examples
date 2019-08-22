
# ===================================================================================
#  The WebRTC CMake configuration file
#
#  Usage from an external project:
#    In your CMakeLists.txt, add these lines:
#
#    FIND_PACKAGE(WebRTC REQUIRED)
#    TARGET_LINK_LIBRARIES(MY_TARGET_NAME ${WEBRTC_LIBS})
#
#
#    This file will define the following variables:
#      - WebRTC_LIBRARIES                : The list of libraries to link against.
#      - WebRTC_INCLUDE_DIRS             : The WEBRTC include directories.
#
# ===================================================================================
if(POLICY CMP0074)
  cmake_policy(SET CMP0074 NEW)
endif()

if(NOT WEBRTC_ROOT)
  set(WEBRTC_ROOT "$ENV{WEBRTC_ROOT}")
endif()

if(NOT WEBRTC_ROOT)
  find_path(WEBRTC_DIR NAMES webrtc.gni)
endif()

set(WebRTC_INCLUDE_DIRS ${WEBRTC_DIR})

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(WebRTC
  FOUND_VAR
    WebRTC_FOUND
  REQUIRED_VARS
    WebRTC_INCLUDE_DIRS
    WebRTC_LIBRARIES
)
# WebRTC:: targets
if(WEBRTC_FOUND)
    add_library(WebRTC::WebRTC INTERFACE IMPORTED)
    set_target_properties(WebRTC::WebRTC PROPERTIES IMPORTED_LIBNAME
                            "${OPENGL_opengl_LIBRARY}")
    set_target_properties(WebRTC::WebRTC PROPERTIES INTERFACE_INCLUDE_DIRECTORIES
                            "${WEBRTC_INCLUDE_DIR}")
endif()
