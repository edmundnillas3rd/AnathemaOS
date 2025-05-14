#!/usr/bin/bash

BINUTILS_MAJOR_VERSION=2 
BINUTILS_MINOR_VERSION=38
BINUTILS_PACKAGE_NAME="binutils-$BINUTILS_MAJOR_VERSION.$BINUTILS_MINOR_VERSION"
BINUTILS_URL="https://ftp.gnu.org/gnu/binutils/$BINUTILS_PACKAGE_NAME.tar.gz"

pushd "toolchain/tarballs"
    curl -LO "$BINUTILS_URL" 

    pushd ".."
	tar -xvzf "tarballs/$BINUTILS_PACKAGE_NAME.tar.gz" -C "build"
    popd
popd


