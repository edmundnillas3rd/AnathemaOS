
#!/usr/bin/bash

GDB_MAJOR_VERSION=12
GDB_MINOR_VERSION=1
GDB_PACKAGE_NAME="gdb-$GDB_MAJOR_VERSION.$GDB_MINOR_VERSION"
GDB_URL="https://ftp.gnu.org/gnu/gdb/$GDB_PACKAGE_NAME.tar.gz"

if [ ! -e "toolchain/tarballs/$GDB_PACKAGE_NAME.tar.gz" ]; then
    pushd "toolchain/tarballs"
	curl -LO "$GDB_URL" 
    popd
fi

pushd "toolchain"
    if [ ! -d "$GDB_PACKAGE_NAME" ]; then
	echo "Extracting file..."
	tar -xvzf "tarballs/$GDB_PACKAGE_NAME.tar.gz"
    fi

    mkdir -p "$GDB_PACKAGE_NAME/build_$GDB_PACKAGE_NAME"
    pushd "$GDB_PACKAGE_NAME/build_$GDB_PACKAGE_NAME"
        /bin/bash ../configure --target=$TARGET --prefix="$PREFIX" --disable-werror
        make -j2 all-gdb
        make -j2 install-gdb
    popd
popd
