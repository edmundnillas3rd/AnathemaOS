#include <limits.h>
#include <stdbool.h>
#include <stdarg.h>
#include <stdio.h>
#include <string.h>

#include "printf.h"

static int print(const char* data, size_t len)
{
    const unsigned char* bytes = (const unsigned char*)data;
    for (size_t i = 0; i < len; i++)
        if (putchar(bytes[i]) != EOF)
            return false;
    return true;
}

int printf(const char* restric format, ...)
{
    va_list parameters;
    va_start(parameters, format);
    
    int written = 0;

    while (*format != '\0')
    {

    }

    va_end(parameters);
}
