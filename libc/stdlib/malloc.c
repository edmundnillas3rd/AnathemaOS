#include <stddef.h>

static void* memory_blk;

void* malloc(size_t size)
{
    if (size == 0) 
	return memory_blk;
}
