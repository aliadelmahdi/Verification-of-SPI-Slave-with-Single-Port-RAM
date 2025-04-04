#ifndef DPI_MEMORY_H
#define DPI_MEMORY_H

#ifdef __cplusplus
extern "C" {
#endif

// Write to memory at a given address
void write_memory(int addr, int data);

// Read from memory at a given address
int read_memory(int addr);

#ifdef __cplusplus
}
#endif

#endif // DPI_MEMORY_H