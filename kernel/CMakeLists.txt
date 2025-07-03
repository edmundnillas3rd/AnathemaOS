cmake_minimum_required(VERSION 3.22)
project(AnathemaKernel C CXX ASM)

set(KERNEL_SOURCE_FILES 
   "main.c"
)

set(KERNEL_SOURCE_FILES
    "${KERNEL_SOURCE_FILES}"

    "boot.s"
)

add_executable(
    ${PROJECT_NAME}
    ${KERNEL_SOURCE_FILES}
)


target_link_options(${PROJECT_NAME} PRIVATE "LINKER:-T${CMAKE_CURRENT_SOURCE_DIR}/linker.ld")

add_subdirectory(libc)
add_subdirectory(arch)

target_link_libraries(
    ${PROJECT_NAME} PUBLIC
    AnathemaLibC
    AnathemaArch
)

set_target_properties(${PROJECT_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_SOURCE_DIR}/bin/$<CONFIG>")
set_target_properties(${PROJECT_NAME} PROPERTIES RUNTIME_OUTPUT_NAME "${PROJECT_NAME}.bin")

add_custom_target(
    kernel_image ALL
    COMMAND ${CMAKE_COMMAND} -E env "TOOLCHAIN_PATH=${TOOLCHAIN_PATH}" "OS_PROJECT_NAME=${CMAKE_PROJECT_NAME}" "OS_BINARY_NAME=${PROJECT_NAME}" "TARGET=i386" "scripts/run_image.sh"
    WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
)
