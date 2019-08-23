cmake_minimum_required(VERSION 3.10)
project(webrtc-examples)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)

find_package(WebRTC REQUIRED)

add_subdirectory(peerconnection)
