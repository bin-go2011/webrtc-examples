add_executable(peerconnection_server
${WEBRTC_ROOT_DIR}/examples/peerconnection/server/data_socket.cc
${WEBRTC_ROOT_DIR}/examples/peerconnection/server/data_socket.h
${WEBRTC_ROOT_DIR}/examples/peerconnection/server/main.cc
${WEBRTC_ROOT_DIR}/examples/peerconnection/server/peer_channel.cc
${WEBRTC_ROOT_DIR}/examples/peerconnection/server/peer_channel.h
${WEBRTC_ROOT_DIR}/examples/peerconnection/server/utils.cc
${WEBRTC_ROOT_DIR}/examples/peerconnection/server/utils.h
)

target_include_directories(peerconnection_server PRIVATE ${WebRTC_INCLUDE_DIRS})