cmake_minimum_required(VERSION 3.20)
project(AnathemaKernel C CXX ASM)

set(KERNEL_SOURCE_FILES 
    main.c 
)

set(KERNEL_SOURCE_FILES
    ${KERNEL_SOURCE_FILES}

    boot.s
)

add_executable(
    ${PROJECT_NAME}
    ${KERNEL_SOURCE_FILES}
)

target_link_options(${PROJECT_NAME} PRIVATE "LINKER:-T${CMAKE_CURRENT_SOURCE_DIR}/linker.ld")

add_subdirectory("${CMAKE_SOURCE_DIR}/arch" "bin")
add_subdirectory("${CMAKE_SOURCE_DIR}/libc" "bin/libc")

target_link_libraries(
    ${PROJECT_NAME} PUBLIC
    AnathemaArch
    AnathemaLibC
)

set_target_properties(
    ${PROJECT_NAME}
    PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin/$<CONFIG>
    RUNTIME_OUTPUT_NAME ${PROJECT_NAME}.bin
)
