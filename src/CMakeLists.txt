#指定头文件路径，这里头文件是源文件所在位置，PROJECT_SOURCE_DIR和CMAKE_SOURCE_DIR、<projectname>_SOURCE_DIR都是工程的顶级目录；
include_directories(${PROJECT_SOURCE_DIR}/libhello)
#指定库文件路径，由于最后会有安装环节。所以库在编译位置和安装位置都有一份。
#建议使用安装位置的库。因为在安装之后，安装位置自的执行文件找不到编译位置的库。
link_directories(${CMAKE_INSTALL_PREFIX}/lib)
#link_directories(${PROJECT_BINARY_DIR}/lib)

aux_source_directory(. APP_SRC)
#生成的可执行文件的路径，PROJECT_BINARY_DIR和CMAKE_BINARY_DIR、<projectname>_BINARY_DIR都是指进行编译的目录；
set(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)

add_executable(hello ${APP_SRC})

#链接库，库名和add_library()命令的参数一直，和文件名无关。库的文件名可以通过set_target_properties修改。但链接时仍然采用最初的命名
target_link_libraries(hello hello_dynamic)

#安装程序到${CMAKE_INSTALL_PREFIX}/bin目录；
install(TARGETS hello RUNTIME DESTINATION bin)
#install(TARGETS hello ${CMAKE_INSTALL_PREFIX}/bin) 此命令不可用

#设定安装的可执行文件所需的库文件路径
set_property(TARGET hello PROPERTY INSTALL_RPATH_USE_LINK_PATH TRUE)

