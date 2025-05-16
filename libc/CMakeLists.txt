cmake_minimum_required(VERSION 3.22)
project(AnathemaLibC C CXX) 

set(C_LIBRARY_SOURCES
    "printf.c"
    "strlen.c"
    "malloc.c"
)

add_library(${PROJECT_NAME} STATIC ${C_LIBRARY_SOURCES})

