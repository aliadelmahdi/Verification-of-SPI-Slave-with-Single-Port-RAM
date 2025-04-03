package shared_pkg;

    // Include macros inside the package
    `include "spi_defines.svh"
    
    typedef enum {IDLE, CHK_CMD, WRITE, READ_ADD, READ_DATA, INVALID} state_e;

    parameter MEM_DEPTH = 256;
	parameter ADDR_SIZE = 8;

    
endpackage
    