#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>

enum VGAColor {
    VGA_COLOR_BLACK         = 0,
    VGA_COLOR_BLUE          = 1,
    VGA_COLOR_GREEN         = 2,
    VGA_COLOR_CYAN          = 3,
    VGA_COLOR_RED           = 4,
    VGA_COLOR_MAGENTA       = 5,
    VGA_COLOR_BROWN         = 6,
    VGA_COLOR_LIGHT_GREY    = 7,
    VGA_COLOR_DARK_GREY     = 8,
    VGA_COLOR_LIGHT_BLUE    = 9,
    VGA_COLOR_LIGHT_GREEN   = 10,
    VGA_COLOR_LIGHT_CYAN    = 11,
    VGA_COLOR_LIGHT_RED     = 12,
    VGA_COLOR_LIGHT_MAGENTA = 13,
    VGA_COLOR_LIGHT_BROWN   = 14,
    VGA_COLOR_WHITE         = 15,
};

static inline uint8_t VGAEntryColor(enum VGAColor fg, enum VGAColor bg)
{
    return fg | bg << 4;
}

static inline uint16_t VGAEntry(unsigned char uc, uint8_t color)
{
    return (uint16_t) uc | (uint16_t) color << 8;
}

size_t strlen(const char* str)
{
    size_t len = 0;
    while (str[len])
        len++;
    return len;
}

static const size_t VGA_WIDTH   = 80;
static const size_t VGA_HEIGHT  = 25;

size_t      terminalRow;
size_t      terminalColumn;
uint8_t     terminalColor;
uint16_t*   terminalBuffer;

void TerminalInitialize(void)
{
    terminalRow = 0;
    terminalColumn = 0;
    terminalColor = VGAEntryColor(VGA_COLOR_LIGHT_GREY, VGA_COLOR_BLACK);
    terminalBuffer = (uint16_t*)0xB8000;
    for (size_t y = 0; y < VGA_WIDTH; y++)
    {
        for (size_t x = 0; x < VGA_HEIGHT; x++)
        {
            const size_t index = y * VGA_WIDTH + x;
            terminalBuffer[index] = VGAEntry(' ', terminalColor); 
        }
    }
}

void TerminalSetColor(uint8_t color)
{
    terminalColor = color;
}

void TerminalPutentryat(char c, uint8_t color, size_t x, size_t y)
{
    const size_t index = y * VGA_WIDTH + x;
    terminalBuffer[index] = VGAEntry(c, color);
}

void TerminalPutchar(char c)
{
    if (c == '\n')
    {
        terminalRow++;
        terminalColumn = 0;
        return;
    }

    TerminalPutentryat(c, terminalColor, terminalColumn, terminalRow); 
    if (++terminalColumn == VGA_WIDTH)
    {
        terminalColumn = 0;
        if (terminalRow == VGA_HEIGHT)
            terminalRow = 0;
    }
}

void TerminalWrite(const char* data, size_t size)
{
    for (size_t i = 0; i < size; i++)
        TerminalPutchar(data[i]);
}

void TerminalWriteString(const char* data)
{
    TerminalWrite(data, strlen(data));
}

void kernel_main(void)
{
    TerminalInitialize();

    TerminalWriteString("Hello, kernel World!\n");
}
