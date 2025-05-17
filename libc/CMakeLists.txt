cmake_minimum_required(VERSION 3.22)
project(AnathemaLibC C CXX) 

set(C_SOURCE_FILES
    "string/strlen.c"
)

add_library(${PROJECT_NAME} STATIC ${C_SOURCE_FILES} ${C_HEADER_FILES})

target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})

