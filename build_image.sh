#!/usr/bin/bash

BINARY_NAME=AnathemaKernel
PROJECT_NAME=AnathemaOS

cp "bin/$BINARY_NAME.bin" "isodir/boot/$BINARY_NAME.bin"
grub-mkrescue -o "$PROJECT_NAME.iso" isodir

qemu-system-i386 -cdrom "$PROJECT_NAME.iso"
