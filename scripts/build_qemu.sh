#!/usr/bin/bash

QEMU_MAJOR_VERSION=10
QEMU_MINOR_VERSION=0.0
QEMU_PACKAGE_NAME="qemu-$QEMU_MAJOR_VERSION.$QEMU_MINOR_VERSION-rc0"
QEMU_URL="https://download.qemu.org/$QEMU_PACKAGE_NAME.tar.xz"

if [ ! -e "toolchain/tarballs/$QEMU_PACKAGE_NAME.tar.xz" ]; then
    pushd "toolchain/tarballs"
	curl -LO "$QEMU_URL" 
    popd
fi

pushd "toolchain"
    if [ ! -d "$QEMU_PACKAGE_NAME" ]; then
	echo "Extracting file..."
	tar -xvJf "tarballs/$QEMU_PACKAGE_NAME.tar.xz"
    fi

    mkdir -p "$QEMU_PACKAGE_NAME/build_$QEMU_PACKAGE_NAME"
    pushd "$QEMU_PACKAGE_NAME/build_$QEMU_PACKAGE_NAME"
        /bin/bash ../configure --target-list="i386-softmmu x86_64-softmmu" --prefix="$PREFIX" --python="/usr/bin/python3" --disable-werror --disable-xen
        make -j2
	make -j2 install
    popd
popd
