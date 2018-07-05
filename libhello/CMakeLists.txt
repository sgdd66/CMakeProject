#设定需要编译的文件
set(LIB_SRC hello.c)

add_definitions("-DLIBHELLO_BUILD")

#生成的库文件路径，PROJECT_BINARY_DIR和CMAKE_BINARY_DIR、<projectname>_BINARY_DIR都是指进行编译的目录；
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

#生成动态链接库
add_library(hello_dynamic SHARED ${LIB_SRC})
#生成静态库
add_library(hello_static STATIC ${LIB_SRC})

#将生成的库安装到指定位置，这里的lib相当于${PROJECT_BINARY_DIR}/lib，注意动态链接库和静态链接库的不同。这里安装位置不是编译位置，而是make install中所指定的位置。如果不设置，默认是不安装的。
install(TARGETS hello_dynamic LIBRARY DESTINATION lib)

install(TARGETS hello_static ARCHIVE DESTINATION lib)

install(FILES hello.h  DESTINATION include)

#将静态和动态链接库重命名
set_target_properties(hello_dynamic PROPERTIES OUTPUT_NAME "hello_dll")

set_target_properties(hello_static PROPERTIES OUTPUT_NAME "hello_sll")

#set(mylable mymain1)
#message(${mylable})
