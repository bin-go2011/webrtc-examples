
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
if (DEFINED ENV{WEBRTC_ROOT_DIR})
  set(WEBRTC_ROOT_DIR $ENV{WEBRTC_ROOT_DIR})
  message("WEBRTC_ROOT_DIR = '${WEBRTC_ROOT_DIR}' from environment variable")
endif()

if ( "${WEBRTC_ROOT_DIR}" STREQUAL "")
    message(FATAL_ERROR "A WEBRTC_ROOT_DIR is requred. \n"
                        " ex) cmake .. -DWEBRTC_ROOT_DIR=/path/to/webrtc-checkout/src\n")
endif()

find_path(WebRTC_INCLUDE_DIRS NAMES "webrtc.gni" PATHS "${WEBRTC_ROOT_DIR}"  NO_DEFAULT_PATH)

# include(FindPackageHandleStandardArgs)
# find_package_handle_standard_args(WebRTC
#   FOUND_VAR
#     WebRTC_FOUND
#   REQUIRED_VARS
#     WebRTC_INCLUDE_DIRS
#     WebRTC_LIBRARIES
# )
# WebRTC:: targets
if(WEBRTC_FOUND)
    add_library(WebRTC::WebRTC INTERFACE IMPORTED)
    set_target_properties(WebRTC::WebRTC PROPERTIES IMPORTED_LIBNAME
                            "${OPENGL_opengl_LIBRARY}")
    set_target_properties(WebRTC::WebRTC PROPERTIES INTERFACE_INCLUDE_DIRECTORIES
                            "${WEBRTC_INCLUDE_DIR}")
endif()
