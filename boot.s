/*
*   Entry Point of the Kernel
*
*   Multi-boot header
*/

/* Constants */
.set ALIGN,     1<<0
.set MEMINFO,   1<<1
.set FLAGS,     ALIGN | MEMINFO
.set MAGIC,     0x1BADB002
.set CHECKSUM,  -(MAGIC + FLAGS) 



/*
*   Magic values for the multiboot loader
*/
.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM



/*
*   Defines the stack value pointer of the kernel
*/
.section .bss
.align 16
stack_bottom:
.skip 16834 # 16 KiB
stack_top:


/*
*   Entry point of the kernel
*/
.section .text
.global _start
.type _start @function
_start:

    mov $stack_top, %esp

    call kernel_main

    cli
1:  hlt
    jmp 1b

.size _start, . - _start
