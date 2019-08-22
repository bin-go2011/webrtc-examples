# WebRTC:: targets
if(WEBRTC_FOUND)
    add_library(WebRTC::WebRTC INTERFACE IMPORTED)
    set_target_properties(WebRTC::WebRTC PROPERTIES IMPORTED_LIBNAME
                            "${OPENGL_opengl_LIBRARY}")
    set_target_properties(WebRTC::WebRTC PROPERTIES INTERFACE_INCLUDE_DIRECTORIES
                            "${WEBRTC_INCLUDE_DIR}")
endif()