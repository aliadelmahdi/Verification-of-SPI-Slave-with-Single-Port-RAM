package shared_pkg;

    // Include macros inside the package
    `include "spi_defines.svh"
    
    typedef enum logic [2:0] {
        IDLE      = 3'b000,
        CHK_CMD   = 3'b001,
        WRITE     = 3'b100,
        READ_ADD  = 3'b010,
        READ_DATA = 3'b011,
        INVALID   = 3'b111
      } state_e;
      
      typedef enum logic [1:0] {
        WR_ADDR = 2'b00,
        WR_DATA = 2'b01,
        RD_ADDR = 2'b10,
        RD_DATA = 2'b11
      } control_e;
      
    // parameter IDLE=3'b000;
    // parameter CHK_CMD=3'b001;
    // parameter READ_ADD=3'b010;
    // parameter READ_DATA=3'b011;
    // parameter WRITE=3'b100;

    parameter MEM_DEPTH=256;
    parameter ADDR_SIZE=8;
    parameter MEM_WIDTH=8;
    
endpackage
    