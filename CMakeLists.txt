project(HELLO)

cmake_minimum_required(VERSION 2.8)

#set(CMAKE_BUILD_TYPE Profile)
#set(CMAKE_CXX_FLAGS_PROFILE "-pg")

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pg")
SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -pg")
SET(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -pg")


#设定安装目录，此处的设置等级高于cmake参数，即cmake .. -DCMAKE_INSTALL_PREFIX=/tmp/hello这种设置方式。
set(CMAKE_INSTALL_PREFIX /tmp/hello)

#定义该目录下包含的其他子目录
add_subdirectory(src)
add_subdirectory(libhello)



