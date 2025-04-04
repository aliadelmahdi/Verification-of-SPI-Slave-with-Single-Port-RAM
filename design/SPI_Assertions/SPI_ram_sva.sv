/*  
    This assertion file follows the **Verification Plan** numbering  
    Each section corresponds to a specific verification requirement

    The numbers (e.g., 1, 2.2) match the corresponding test items  
    from the **Verification Plan** for traceability and clarity
*/
`include "spi_defines.svh" // For macros
import shared_pkg::*; // For enums and parameters
`timescale `TIME_UNIT / `TIME_PRECISION

module SPI_ram_sva(
    input clk,rst_n,rx_valid,
    input[MEM_WIDTH+1:0]din,
    input logic [MEM_WIDTH-1:0]dout,
    input logic tx_valid
    );
    
endmodule


