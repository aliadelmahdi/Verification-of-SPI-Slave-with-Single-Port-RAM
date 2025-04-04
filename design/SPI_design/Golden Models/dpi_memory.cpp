#include "dpi_memory.h"
#include <cstdint>
#include <iostream>

const int MEM_DEPTH = 1024;
static uint32_t memory[MEM_DEPTH] = {0};

extern "C" {

    void write_memory(int addr, int data) {
        if (addr < 0 || addr >= MEM_DEPTH) {
            std::cerr << "write_memory: Invalid address " << addr << std::endl;
            return;
        }
        memory[addr] = static_cast<uint32_t>(data);
    }

    int read_memory(int addr) {
        if (addr < 0 || addr >= MEM_DEPTH) {
            std::cerr << "read_memory: Invalid address " << addr << std::endl;
            return 0;
        }
        return static_cast<int>(memory[addr]);
    }
}
