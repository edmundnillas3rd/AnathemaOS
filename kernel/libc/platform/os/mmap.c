#include <stddef.h>
#include <stdlib.h>

#include "../platform.h"

// Reference: https://people.kth.se/~johanmon/ose/assignments/maplloc.pdf

static char* heap;

static char* brkp = NULL;
static char* endp = NULL;

void* mmap(void* addr, size_t length, int prot, int flags, int fd, size_t offset)
{
    return NULL;
}
