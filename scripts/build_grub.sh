#!/usr/bin/bash

GRUB_MAJOR_VERSION=2
GRUB_MINOR_VERSION=06
GRUB_PACKAGE_NAME="grub-$GRUB_MAJOR_VERSION.$GRUB_MINOR_VERSION"
GRUB_URL="https://ftp.gnu.org/gnu/grub/$GRUB_PACKAGE_NAME.tar.gz"

HOST=x86_64-linux-gnu

pushd "toolchain/tarballs"
    if [ ! -e "$GRUB_PACKAGE_NAME.tar.gz" ]; then
	curl -LO "$GRUB_URL" 
    fi
popd

pushd "toolchain"
    if [ ! -d "$GRUB_PACKAGE_NAME" ]; then
	echo "Extracting file..."
	tar -xvzf "tarballs/$GRUB_PACKAGE_NAME.tar.gz"
    fi

    mkdir -p "$GRUB_PACKAGE_NAME/build_$GRUB_PACKAGE_NAME"
    pushd "$GRUB_PACKAGE_NAME/build_$GRUB_PACKAGE_NAME"
	 /bin/bash ../configure --target=$TARGET --prefix="$PREFIX" --with-platform=efi --disable-werror
	 make -j2 install
    popd
popd
