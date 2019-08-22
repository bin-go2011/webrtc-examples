
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
#      - WEBRTC_LIBS                     : The list of libraries to link against.
#      - WEBRTC_INCLUDE_DIRS             : The WEBRTC include directories.
#
# ===================================================================================
if(POLICY CMP0074)
  cmake_policy(SET CMP0074 NEW)
endif()

if(NOT WebRTC_ROOT)
  set(WebRTC_ROOT "$ENV{WebRTC_ROOT}")
endif()

if(NOT WebRTC_ROOT)
  find_path(WebRTC_DIR NAMES webrtc.gni)
else()
  set(WebRTC_DIR ${WebRTC_ROOT})
endif()

message(STATUS WebRTC_ROOT ${WebRTC_ROOT})
# WebRTC:: targets
if(WEBRTC_FOUND)
    add_library(WebRTC::WebRTC INTERFACE IMPORTED)
    set_target_properties(WebRTC::WebRTC PROPERTIES IMPORTED_LIBNAME
                            "${OPENGL_opengl_LIBRARY}")
    set_target_properties(WebRTC::WebRTC PROPERTIES INTERFACE_INCLUDE_DIRECTORIES
                            "${WEBRTC_INCLUDE_DIR}")
endif()
