cmake_minimum_required(VERSION 3.22)
project(AnathemaOS C CXX ASM)

message(STATUS "KERNEL C COMPILER: ${CMAKE_C_COMPILER}")
message(STATUS "KERNEL CXX COMPILER: ${CMAKE_CXX_COMPILER}")

add_subdirectory(kernel)
