#!/usr/bin/bash

GCC_MAJOR_VERSION=11
GCC_MINOR_VERSION=4.0
GCC_PACKAGE_NAME="gcc-$GCC_MAJOR_VERSION.$GCC_MINOR_VERSION"
GCC_URL="https://ftp.gnu.org/gnu/gcc/$GCC_PACKAGE_NAME/$GCC_PACKAGE_NAME.tar.gz"

if [ ! -e "toolchain/tarballs/$GCC_PACKAGE_NAME.tar.gz" ]; then
    pushd "toolchain/tarballs"
	curl -LO "$GCC_URL" 
    popd
fi

pushd "toolchain"
    if [ ! -d "$GCC_PACKAGE_NAME" ]; then
	echo "Extracting file..."
	tar -xvzf "tarballs/$GCC_PACKAGE_NAME.tar.gz"
    fi

    mkdir -p "$GCC_PACKAGE_NAME/build_$GCC_PACKAGE_NAME"
    pushd "$GCC_PACKAGE_NAME/build_$GCC_PACKAGE_NAME"
	# NOTE(Edmund): GCC 11.40 uses only the following targets below
	# all-gcc
	# all-target-libgcc
	# install-gcc
	# install-target-libgcc
	# Reference: https://wiki.osdev.org/index.php?title=GCC_Cross-Compiler&oldid=28436

	/bin/bash ../configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
	make -j2 all-gcc
	make -j2 all-target-libgcc
	make -j2 install-gcc
	make -j2 install-target-libgcc
    popd
popd
