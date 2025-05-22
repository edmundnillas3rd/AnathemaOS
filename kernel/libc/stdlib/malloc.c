#include <stdlib.h>
#include <platform/platform.h>

struct altab aldata = {0};

void* get_mem(size_t size)
{
    void* p;
    int isize = size;
    // NOTE(Edmund): (platform/os/mmap.c) Implement c system service for allocating a block of storage for AnathemaOS
    return (isize <= 0 || (p = mmap(NULL, isize, 0, 0, 0, 0)) == (void*)-1 ? NULL : p);
}

static struct cell** find_mem(size_t size)
{
    struct cell *q, **qb;

    for (;;)
    {
	if ((qb = aldata.plast) == NULL)
	{
	    for (qb = &aldata.head; *qb; qb = &(*qb)->next)
		if (size <= (*qb)->size)
		    return qb;
	}
	else
	{
	    for (; *qb; qb = &(*qb)->next)
		if (size <= (*qb)->size)
		    return qb;
	    q = *aldata.plast;
	    for (qb = &aldata.head; *qb != q; qb = &(*qb)->next)
		if (size <= (*qb)->size)
		    return qb;
	}

	size_t bs;
	const size_t sz = size + CELL_OFF;

	for (bs = SIZE_BLOCK; ;bs >>=1)
	{
	    if (bs < sz)
		bs = sz;
	    if ((q = get_mem(bs)) != NULL)
		break;
	    else if (bs == sz)
		return NULL;
	}
	q->size = (bs & ~_MEMBND) - CELL_OFF;
	free((char*)q + CELL_OFF);
    }
}

void* malloc(size_t size)
{
    struct cell *q, **qb;

    if (size < SIZE_CELL)
	size = SIZE_CELL;
    size = (size + _MEMBND) & _MEMBND;
    if ((qb = find_mem(size)) == NULL)
	return NULL; 
    q = *qb;
    if (q->size < size + CELL_OFF + SIZE_CELL)
	*qb = q->next;
    else
    {
	*qb = (struct cell*)(char*)q +	CELL_OFF + size;
	(*qb)->next = q->next;
	(*qb)->size = q->size - CELL_OFF - size;
	q->size = size;
    }
    aldata.plast = qb ? qb : NULL;
    return ((char*)q + CELL_OFF);
}
