#!/usr/bin/sh

BINUTILS_MAJOR_VERSION=2 # Ubuntu only has this particular version, and I don't want to work with snapd
BINUTILS_MINOR_VERSION=38
BINUTILS_PACKAGE_NAME="binutils-$BINUTILS_MAJOR_VERSION.$BINUTILS_MINOR_VERSION"
BINUTILS_URL="https://ftp.gnu.org/gnu/binutils/$BINUTILS_PACKAGE_NAME.tar.gz"

if [ ! -d "$BINUTILS_PACKAGE_NAME" ]; then
    mkdir -v "$BINUTILS_PACKAGE_NAME-build"
    curl -LO "$BINUTILS_URL"
fi

GCC_MAJOR_VERSION=11
GCC_MINOR_VERSION=4.0
GCC_PACKAGE_NAME="gcc-$GCC_MAJOR_VERSION.$GCC_MINOR_VERSION"
GCC_URL="https://ftp.gnu.org/gnu/gcc/$GCC_PACKAGE_NAME/$GCC_PACKAGE_NAME.tar.gz"

if [ ! -d "$GCC_PACKAGE_NAME" ]; then
    mkdir -v "$GCC_PAGKAGE_NAME-build"
    curl -LO "$GCC_URL"
fi

tar -xvf "$BINUTILS_PACKAGE_NAME.tar.gz"
tar -xvf "$GCC_PACKAGE_NAME.tar.gz"

rm -r "bintuls-*"
rm -r "gcc-*" 
