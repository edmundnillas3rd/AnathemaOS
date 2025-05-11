#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include "tty/tty.h"

void kernel_main(void) 
{
    terminal_initialize();
}
