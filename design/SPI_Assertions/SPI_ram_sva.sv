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
   
    
    input MOSI,clk,rst_n,SS_n,tx_valid,
	input logic [7:0] tx_data,

	output logic MISO,rx_valid,
	output logic [9:0] rx_data
    );
    
endmodule