add_executable(peerconnection_server
    server/data_socket.cc
    server/data_socket.h
    server/main.cc
    server/peer_channel.cc
    server/peer_channel.h
    server/utils.cc
    server/utils.h
)

target_include_directories(peerconnection_server PRIVATE ${WebRTC_INCLUDE_DIRS})