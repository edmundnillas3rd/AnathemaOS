#include <limits.h>
#include <stdbool.h>
#include <stdarg.h>
#include <stddef.h>

#define EOF 0

#include "stdio.h"

static int print(const char* data, size_t len)
{
    const unsigned char* bytes = (const unsigned char*)data;
    for (size_t i = 0; i < len; i++)
        if (putchar(bytes[i]) != EOF)
            return false;
    return true;
}

int printf(const char* restrict format, ...)
{
}
