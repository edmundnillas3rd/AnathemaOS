cmake_minimum_required(VERSION 3.22)
project(AnathemaLibC C CXX) 

set(C_LIBRARY_SOURCES
    "string/strlen.c"
)

add_library(${PROJECT_NAME} STATIC ${C_LIBRARY_SOURCES})

target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

