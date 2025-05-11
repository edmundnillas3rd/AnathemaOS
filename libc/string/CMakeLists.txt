cmake_minimum_required(VERSION 3.22)
project(AnathemaStringLib C CXX)

file(GLOB_RECURSE SOURCE_FILES "${CMAKE_CURRENT_SOURCE_DIR}/*.c" "${CMAKE_CURRENT_SOURCE_DIR}/*.h")

add_library(
    ${PROJECT_NAME} OBJECT
    ${SOURCE_FILES}
)
