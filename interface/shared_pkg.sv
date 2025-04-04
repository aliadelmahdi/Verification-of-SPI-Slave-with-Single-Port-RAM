package shared_pkg;

    // Include macros inside the package
    `include "spi_defines.svh"
    
    // typedef enum {IDLE, CHK_CMD, WRITE, READ_ADD, READ_DATA, INVALID} state_e;
    parameter IDLE=3'b000;
    parameter CHK_CMD=3'b001;
    parameter READ_ADD=3'b010;
    parameter READ_DATA=3'b011;
    parameter WRITE=3'b100;

    parameter MEM_DEPTH=256;
    parameter ADDR_SIZE=8;
    parameter MEM_WIDTH=8;
    
endpackage
    