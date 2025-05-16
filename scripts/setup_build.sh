PREFIX="$HOME/AnathemaOS/toolchain/build"
TARGET=i686-elf
PATH="$PREFIX/bin:$PATH"

mkdir -p "toolchain/tarballs"

source "scripts/build_binutils.sh"
source "scripts/build_gdb.sh"
source "scripts/build_gcc.sh"
source "scripts/build_grub.sh"
source "scripts/build_qemu.sh"

export PATH="$HOME/AnathemaOS/toolchain/build/bin:$PATH"
