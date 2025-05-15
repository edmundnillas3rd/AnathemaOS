cmake_minimum_required(VERSION 3.22)
project(AnathemaOS C CXX ASM)


message(STATUS "CMAKE_TOOLCHAIN_FILE: ${CMAKE_TOOLCHAIN_FILE}")
message(STATUS "TOOLCHAIN_PATH: ${TOOLCHAIN_PATH}")

add_subdirectory(kernel)

