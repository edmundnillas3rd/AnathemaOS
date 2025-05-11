cmake_minimum_required(VERSION 3.22)
project(AnathemaOS C CXX ASM)

add_subdirectory(kernel)

include_directories(.)
include_directories(libc)
include_directories(arch)
