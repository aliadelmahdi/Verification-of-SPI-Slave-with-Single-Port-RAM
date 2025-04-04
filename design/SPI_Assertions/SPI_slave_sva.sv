/*  
    This assertion file follows the **Verification Plan** numbering  
    Each section corresponds to a specific verification requirement

    The numbers (e.g., 1, 2.2) match the corresponding test items  
    from the **Verification Plan** for traceability and clarity
*/
`include "spi_defines.svh" // For macros
import shared_pkg::*; // For enums and parameters
`timescale `TIME_UNIT / `TIME_PRECISION



module SPI_slave_sva(cs,MOSI,SS_n,clk,rst_n,tx_data,tx_valid,MISO,rx_data,rx_valid);
    
    input MOSI,clk,rst_n,SS_n,tx_valid;
    input [MEM_WIDTH-1:0] tx_data;

	input logic MISO,rx_valid;
	input logic [MEM_WIDTH+1:0] rx_data;
    input logic [2:0] cs;
    property check_reset_data;
            (!rst_n)|=> ( (rx_data==0)
                      && !MISO
                      && !rx_valid
                      && (cs == IDLE)
                     ); 
                     
    endproperty

    assert_reset_data: assert property (@(posedge clk) check_reset_data)

        else begin
        $error("Failed to assert reset data");
        $display("MISO = %b, MOSI = %b, rx_valid = %b, cs = %b, rx_data = %h", 
                      MISO, MOSI, rx_valid, cs, rx_data);
        end

    property check_reset_state;
            (!rst_n)|=> ( cs == IDLE ); 
                     
    endproperty

    assert_reset_state: assert property (@(posedge clk) check_reset_state)

        else begin
        $error("Failed to assert reset state");
        $display("MISO = %b, MOSI = %b, rx_valid = %b, cs = %b, rx_data = %h", 
                      MISO, MOSI, rx_valid, cs, rx_data);
        end
    property idle_to_idle;
    @(posedge clk) disable iff(!rst_n)
            (cs==IDLE && SS_n==1) |=> (cs == IDLE);
                     
    endproperty

        assert_idle_to_idle: assert property (@(posedge clk) idle_to_idle)

        else $error("Failed to assert idle_to_idle transition");

    property idle_to_CHK_CMD;
    @(posedge clk) disable iff(!rst_n)
            (cs==IDLE && SS_n==0) |=> (cs == CHK_CMD); 
    endproperty

    assert_idle_to_CHK_CMD: assert property (@(posedge clk) idle_to_CHK_CMD)

        else $error("Failed to assert idle_to_CHK_CMD transition");

    property CHK_CMD_to_idle;
    @(posedge clk) disable iff(!rst_n)
            (cs==CHK_CMD && SS_n==1) |=> (cs == IDLE); 
    endproperty

    assert_CHK_CMD_to_idle: assert property (@(posedge clk) CHK_CMD_to_idle)

        else $error("Failed to assert CHK_CMD_to_idle transition");

    property CHK_CMD_to_write;
    @(posedge clk) disable iff(!rst_n)
            (cs==CHK_CMD && (!SS_n && !MOSI) )|=> (cs == WRITE); 
    endproperty

    assert_CHK_CMD_to_write: assert property (@(posedge clk) CHK_CMD_to_write)

        else $error("Failed to assert CHK_CMD_to_write transition");      
    
    // property CHK_CMD_to_read_data;
    // @(posedge clk) disable iff(!rst_n)
    //         (cs==CHK_CMD && (!SS_n && MOSI) )|=> (cs == READ_DATA); 
    // endproperty

    // assert_CHK_CMD_to_read_data: assert property (@(posedge clk) CHK_CMD_to_read_data)

    //     else $error("Failed to assert CHK_CMD_to_read_data transition"); 

    // property CHK_CMD_to_read_add;
    // @(posedge clk) disable iff(!rst_n)
    //         (cs==CHK_CMD && (!SS_n && MOSI) )|=> (cs == READ_DATA); 
    // endproperty
endmodule