#include <string.h>

void* memmove(void* s1, const void* s2, size_t n)
{
    char* sc1;
    const char* sc2;

    sc1 = s1;
    sc2 = s2;
    if (sc2 < sc1 && sc1 < sc2 + n)
	for (sc1 += n, sc2 += n; 0 < n; --n)
	    *--sc1 = *--sc2;
    else
	for (; 0 < n; --n)
	    *sc1++ = *sc2++;
    return s1;
}

int memcmp(const void* s1, const void* s2, size_t n)
{
    const unsigned char *su1, *su2;
    for (su1 = s1, su2 = s2; 0 < n; ++su1, ++su2, --n)
	if (*su1 != *su2)
	    return ((*su1 < *su2) ? -1 : 1);
    return 0;
}

void* memset(void* s, int c, size_t n)
{
    const unsigned char uc = c;
    unsigned char* su;

    for (su = s; 0 < n; ++su, --n)
	*su = uc;
    return s;
}

void* memcpy(void* s1, const void* s2, size_t n)
{
    char* su1;
    const char* su2;
    for (su1 = s1, su2 = s2; 0 < n; ++su1, ++su2, --n)
	*su1 = *su2;
    return s1;
}

size_t strlen(const char* str) 
{
    size_t len = 0;
    while (str[len])
	    len++;
    return len;
}
