#!/usr/bin/sh

if grub-file --is-x86-multiboot bin/AnathemaKernel.bin; then
  echo multiboot confirmed
else
  echo the file is not multiboot
fi
