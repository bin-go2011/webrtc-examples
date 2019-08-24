
# ===================================================================================
#  The WebRTC CMake configuration file # #  Usage from an external project:
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

list(APPEND WebRTC_INCLUDE_DIRS
  "${WebRTC_INCLUDE_DIRS}/third_party"
  "${WebRTC_INCLUDE_DIRS}/third_party/abseil-cpp"
  )

message(STATUS ${WebRTC_INCLUDE_DIRS})

find_library(WebRTC_LIBRARIES webrtc PATHS "${WEBRTC_ROOT_DIR}/out/Default/obj" NO_DEFAULT_PATH)

message(STATUS found ${WebRTC_FOUND})
# WebRTC:: targets
    set(buildtools 
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/utility.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/bind.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/functional.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/strstream.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/string.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/new.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/optional.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/random.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/debug.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/algorithm.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/thread.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/typeinfo.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/exception.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/chrono.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/system_error.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/any.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/iostream.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/variant.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/condition_variable.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/memory.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/future.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/hash.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/ios.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/valarray.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/stdexcept.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/mutex.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/vector.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/shared_mutex.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/regex.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++/libc++/locale.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/stdlib_stdexcept.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/cxa_virtual.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/cxa_handlers.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/private_typeinfo.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/cxa_unexpected.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/cxa_personality.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/abort_message.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/stdlib_typeinfo.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/stdlib_exception.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/fallback_malloc.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/cxa_exception.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/cxa_guard.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/cxa_default_handlers.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/cxa_vector.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/cxa_demangle.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/cxa_exception_storage.o
          ${WEBRTC_ROOT_DIR}/out/Default/obj/buildtools/third_party/libc++abi/libc++abi/cxa_aux_runtime.o
                                
    )

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(WebRTC
  FOUND_VAR
    WebRTC_FOUND
  REQUIRED_VARS
    WebRTC_INCLUDE_DIRS
    WebRTC_LIBRARIES
)

