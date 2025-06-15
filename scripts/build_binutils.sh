#!/usr/bin/bash

BINUTILS_MAJOR_VERSION=2 
BINUTILS_MINOR_VERSION=38
BINUTILS_PACKAGE_NAME="binutils-$BINUTILS_MAJOR_VERSION.$BINUTILS_MINOR_VERSION"
BINUTILS_URL="https://ftp.gnu.org/gnu/binutils/$BINUTILS_PACKAGE_NAME.tar.gz"

if [ ! -e "toolchain/tarballs/$BINUTILS_PACKAGE_NAME.tar.gz" ]; then
    pushd "toolchain/tarballs"
	curl -LO "$BINUTILS_URL" 
    popd
fi

pushd "toolchain"
    if [ ! -d "$BINUTILS_PACKAGE_NAME" ]; then
	echo "Extracting file..."
	tar -xvzf "tarballs/$BINUTILS_PACKAGE_NAME.tar.gz"
    fi

    mkdir -p "$BINUTILS_PACKAGE_NAME/build_$BINUTILS_PACKAGE_NAME"
    pushd "$BINUTILS_PACKAGE_NAME/build_$BINUTILS_PACKAGE_NAME"
	/bin/bash ../configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
	make -j2
	make -j2 install
    popd
popd
