#!/usr/bin/bash

GRUB_MAJOR_VERSION=2
GRUB_MINOR_VERSION=12
GRUB_PACKAGE_NAME="grub-$GRUB_MAJOR_VERSION.$GRUB_MINOR_VERSION"
GRUB_URL="https://ftp.gnu.org/gnu/grub/$GRUB_PACKAGE_NAME.tar.gz"

if [ ! -e "toolchain/tarballs/$GRUB_PACKAGE_NAME.tar.gz" ]; then
    pushd "toolchain/tarballs"
	curl -LO "$GRUB_URL" 
    popd
fi

pushd "toolchain"
    if [ ! -d "$GRUB_PACKAGE_NAME" ]; then
	echo "Extracting file..."
	tar -xvzf "tarballs/$GRUB_PACKAGE_NAME.tar.gz"
    fi

    echo "depends bli part_gpt" > $GRUB_PACKAGE_NAME/grub-core/extra_deps.lst

    mkdir -p "$GRUB_PACKAGE_NAME/build_$GRUB_PACKAGE_NAME"
    pushd "$GRUB_PACKAGE_NAME/build_$GRUB_PACKAGE_NAME"
	 /bin/bash ../configure --target=$TARGET --prefix="$PREFIX" --disable-werror
	 make -j2 install
    popd

    if [ ! -e "build/share/grub/unicode.pf2" ]; then
	pushd "build"
	    if [ -e "/usr/share/fonts/truetype/unifont/unifont.ttf" ]; then
		bin/grub-mkfont -o share/grub/unicode.pf2 /usr/share/fonts/truetype/unifont/unifont.ttf
	    fi 
	popd
    fi
popd
