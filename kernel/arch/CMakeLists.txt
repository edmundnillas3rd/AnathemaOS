cmake_minimum_required(VERSION 3.22)
project(AnathemaArch C CXX ASM)

add_library(
    ${PROJECT_NAME} OBJECT
    "i386/tty.c"
)

target_include_directories(${PROJECT_NAME} PUBLIC "${CMAKE_SOURCE_DIR}/kernel/libc" SYSTEM) 
