`include "spi_defines.svh" // For macros
import shared_pkg::*; // For enums and parameters

interface SPI_if(input bit clk);

	localparam MEM_DEPTH = shared_pkg::MEM_DEPTH;
	localparam ADDR_SIZE = shared_pkg::ADDR_SIZE;
	localparam MEM_WIDTH = shared_pkg::MEM_WIDTH;

	localparam IDLE = shared_pkg::IDLE;
	localparam CHK_CMD = shared_pkg::CHK_CMD;
	localparam WRITE = shared_pkg::WRITE;
	localparam READ_ADD = shared_pkg::READ_ADD;
	localparam READ_DATA = shared_pkg::READ_DATA;

	// parameter IDLE=3'b000;
    // parameter CHK_CMD=3'b001;
    // parameter READ_ADD=3'b010;
    // parameter READ_DATA=3'b011;
    // parameter WRITE=3'b100;

	// parameter MEM_DEPTH = 256;
	// parameter ADDR_SIZE = 8;

  	logic rst_n,SS_n,MOSI;
	logic MISO;
	logic [MEM_WIDTH-1:0] dout; // tx_data
	logic tx_valid,rx_valid;
	logic [MEM_WIDTH+1:0] rx_data; // din

	logic [MEM_WIDTH-1:0] dout_ref; // tx_data_ref
	logic tx_valid_ref;
	 // DUT modport
    modport RAM_GLD (
        input clk, rst_n, rx_valid, rx_data,
        output tx_valid_ref, dout_ref
    );
	
endinterface