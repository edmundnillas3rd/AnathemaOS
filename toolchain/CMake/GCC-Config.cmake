set(CMAKE_SYSTEM_NAME Generic)

set(CMAKE_C_COMPILER i686-elf-gcc)
set(CMAKE_CXX_COMPILER i686-elf-g++)
set(CMAKE_ASM_COMPILER i686-elf-as)

# Default Compiler Flags
set(CMAKE_C_FLAGS_INIT "-std=gnu99 -ffreestanding -O2 -Wall -Wextra")

# Default Linker Flags
set(CMAKE_EXE_LINKER_FLAGS_INIT "-ffreestanding -O2 -nostdlib -lgcc")

# set(CMAKE_SYSROOT "/home/edmund/opt/cross/lib/gcc/i686-elf/11.4.0")
set(CMAKE_FIND_ROOT_PATH "/home/edmund/opt/cross/bin")
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY BOTH)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH)
