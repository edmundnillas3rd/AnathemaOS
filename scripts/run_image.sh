#!/usr/bin/sh

cp "bin/$OS_BINARY_NAME.bin" "isodir/boot/$OS_BINARY_NAME.bin"
grub-mkrescue -o "$OS_PROJECT_NAME.iso" isodir

qemu-system-i386 -cdrom "$OS_PROJECT_NAME.iso"
