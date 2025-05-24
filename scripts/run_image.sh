#!/usr/bin/sh

cp "bin/$OS_BINARY_NAME.bin" "isodir/boot/$OS_BINARY_NAME.bin"

$TOOLCHAIN_PATH/grub-mkrescue -o "bin/$OS_PROJECT_NAME.iso" isodir
$TOOLCHAIN_PATH/qemu-system-$TARGET -cdrom "bin/$OS_PROJECT_NAME.iso"
