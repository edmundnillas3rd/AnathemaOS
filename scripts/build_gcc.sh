#!/usr/bin/bash

GCC_MAJOR_VERSION=11
GCC_MINOR_VERSION=4.0
GCC_PACKAGE_NAME="gcc-$GCC_MAJOR_VERSION.$GCC_MINOR_VERSION"
GCC_URL="https://ftp.gnu.org/gnu/gcc/$GCC_PACKAGE_NAME/$GCC_PACKAGE_NAME.tar.gz"


push "toolchain/tarballs"
    curl -LO "$GCC_URL" 

    tar -xvz $GCC_PACKAGE_NAME 
popd
