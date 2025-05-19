#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

#include <string.h>

#include "../../tty.h"
#include "vga.h"

static const size_t	    VGA_WIDTH = 80;
static const size_t 	    VGA_HEIGHT = 25;

static size_t		    terminal_row;
static size_t 		    terminal_column;
static uint8_t		    terminal_color;
static uint16_t*	    terminal_buffer;

void terminal_initialize(void) 
{
    terminal_row = 0;
    terminal_column = 0;

    terminal_color = vga_entry_color(VGA_COLOR_LIGHT_GREY, VGA_COLOR_BLUE);

    terminal_buffer = (uint16_t*) 0xB8000;
    for (size_t y = 0; y < VGA_HEIGHT; y++) 
    {
        for (size_t x = 0; x < VGA_WIDTH; x++) 
        {
            const size_t index = y * VGA_WIDTH + x;
            terminal_buffer[index] = vga_entry(' ', terminal_color);
        }
    }
}

static void terminal_setcolor(uint8_t color) 
{
    terminal_color = color;
}

static void terminal_putentryat(char c, uint8_t color, size_t x, size_t y) 
{
    const size_t index = y * VGA_WIDTH + x;
    terminal_buffer[index] = vga_entry(c, color);
}

static void terminal_scroll(void)
{
    static uint16_t* temp_buffer;

    for (size_t j = 0; j < VGA_HEIGHT; j++)
    {
        for (size_t i = 0; i < VGA_WIDTH; i++)
        {
            const size_t index = j * VGA_WIDTH + i;
            temp_buffer[index] = terminal_buffer[index];

            const size_t prev_index = (j - 1) * VGA_WIDTH + i;
            terminal_buffer[prev_index] = temp_buffer[index];
        }
    }

    terminal_row = terminal_row - 1;
    terminal_column = 0;
}

void terminal_putchar(char c) 
{
    if (c == '\n')
    {
        terminal_row++;
        terminal_column = 0;
        return;
    }

    if (terminal_row >= VGA_HEIGHT)
    {
        terminal_scroll();
    }

    terminal_putentryat(c, terminal_color, terminal_column, terminal_row);
    if (++terminal_column == VGA_WIDTH) 
    {
        terminal_column = 0;
        if (++terminal_row == VGA_HEIGHT)
        {
            terminal_row = 0;
        }
    }
}

void terminal_write(const char* data, size_t size) 
{
    for (size_t i = 0; i < size; i++)
    {
        terminal_putchar(data[i]);
    }
}

void terminal_writestring(const char* data) 
{
    terminal_write(data, strlen(data));
}
