#ifndef __STDLIB_H
#define __STDLIB_H

#include <stddef.h>

#include <yvals.h>

#define CELL_OFF	    (sizeof(size_t) + _MEMBND & ~_MEMBND)
#define SIZE_BLOCK	    512
#define SIZE_CELL	    ((sizeof(struct cell) + _MEMBND & ~_MEMBND) - CELL_OFF)

struct cell
{
    size_t		    size;
    struct cell*    	    next;
};

struct altab
{
    struct cell**	    plast;
    struct cell*	    head;
};


extern struct altab aldata;

#define EXIT_SUCCESS	0
#define RAND_MAX	32767

void* get_mem(size_t);
void* abort(void);
void* malloc(size_t);
void free(void*);

#endif
