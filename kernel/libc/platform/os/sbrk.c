#include <stddef.h>
#include <stdlib.h>

#include "../platform.h"

// Reference: https://people.kth.se/~johanmon/ose/assignments/maplloc.pdf

static char* heap;

static char* brkp = NULL;
static char* endp = NULL;

void* sbrk(int size)
{
    // if ( size == 0 ) 
    //     return (void*)brkp;
    // void* free = (void*)brkp;
    // brkp += size;
    // if ( brkp >= endp )
    //     return NULL;
    // return free;
}
