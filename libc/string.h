#ifndef __STRING_H
#define __STRING_H

#include <stddef.h>
#include <yvals.h>

void* memmove(void*, const void*, size_t);

int memcmp(const void*, const void*, size_t); 

void* memset(void*, int, size_t);

void* memcpy(void*, const void*, size_t);

size_t strlen(const char*);

#endif
