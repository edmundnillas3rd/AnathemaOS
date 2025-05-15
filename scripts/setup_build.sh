PREFIX="$HOME/AnathemaOS/toolchain/build"
TARGET=i686-elf
PATH="$PREFIX/bin:$PATH"

pushd "toolchain"
    mkdir -p "tarballs"
popd

source "scripts/build_binutils.sh"
source "scripts/build_gcc.sh"

