cmake_minimum_required(VERSION 3.10)
project(webrtc-starter)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)

find_package(WebRTC REQUIRED)