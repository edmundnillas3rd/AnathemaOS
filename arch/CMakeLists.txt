cmake_minimum_required(VERSION 3.20)
project(AnathemaArch C CXX ASM)

add_library(
    ${PROJECT_NAME} OBJECT
    "${CMAKE_CURRENT_SOURCE_DIR}/i386/tty.c"
)

target_include_directories(
  ${PROJECT_NAME} PRIVATE
  "${CMAKE_CURRENT_SOURCE_DIR}"
  "${CMAKE_SOURCE_DIR}/libc"
  "${CMAKE_SOURCE_DIR}/kernel"
)
