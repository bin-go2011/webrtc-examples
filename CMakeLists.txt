cmake_minimum_required(VERSION 3.10)
project(webrtc-examples)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)

find_package(WebRTC REQUIRED)
add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0 )

add_subdirectory(peerconnection)
