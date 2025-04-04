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
    input logic tx_valid,
    input logic [ADDR_SIZE-1:0]addr_rd,addr_wr,
    input reg [MEM_WIDTH-1:0]mem[MEM_DEPTH-1:0]
    );

        property addr_wr_stored;
        @(posedge clk) disable iff(!rst_n)
                (rx_valid && din[9:8]==2'b00) |=> (addr_wr == $past(din[7:0]));
        endproperty

        assert_addr_wr_stored: assert property (addr_wr_stored)
                else begin
                $error("Failed to assert addr_wr_stored");
                        $display("din[7:0] = %b, addr_wr = %b", din[7:0], addr_wr);
                end
        
        property data_rd_stored;
                @(posedge clk) disable iff(!rst_n)
                        ( din[9:8]==2'b11) |=> ((mem[addr_rd] === dout[7:0]) && (tx_valid==1));
                
                endproperty
                
                        assert_data_rd_stored: assert property ( data_rd_stored)
                
                        else begin
                        $error("Failed to assert data_rd_stored");
                                        $display("dout[7:0]) = %h, mem[addr_rd] = %h tx_valid = %h", 
                                        dout[7:0], mem[addr_rd],tx_valid);
                        end
//  property check_reset;
//             (!rst_n)|=> ( (dout==0)
//                       && !tx_valid
//                      ); 
                     
//     endproperty

//     assert_check_reset: assert property (@(posedge clk) check_reset)

//         else begin
//         $error("Failed to assert reset");
//         end

// property addr_wr_stored;
//    @(posedge clk) disable iff(!rst_n)
//             (rx_valid && din[9:8]==2'b00) |-> (addr_wr == $past(din[7:0])));
                     
//     endproperty

//         assert_addr_wr_stored: assert property ( addr_wr_stored)
//         else begin
//                 $error("Failed to assert addr_wr_stored");
//                     $display("din[7:0] = %h, addr_wr = %h", 
//                           din[7:0], addr_wr);
//         end
// property data_wr_stored;
//     @(posedge clk) disable iff(!rst_n)
//             (rx_valid && din[9:8]==2'b01) |=> (mem[addr_wr] == din[7:0]);
                     
//     endproperty

//         assert_data_wr_stored: assert property (@(posedge clk) data_wr_stored)

//         else $error("Failed to assert data_wr_stored");


// property addr_rd_stored;
//     @(posedge clk) disable iff(!rst_n)
//             (rx_valid && din[9:8]==2'b10) |=> (addr_rd == din[7:0]);
                     
//     endproperty

//         assert_addr_rd_stored: assert property (@(posedge clk) addr_rd_stored)

//         else $error("Failed to assert addr_rd_stored");

// property data_rd_stored;
//     @(posedge clk) disable iff(!rst_n)
//             ( din[9:8]==2'b11) |=> ((mem[addr_rd] == din[7:0]) && (tx_valid==1));
                     
//     endproperty

//         assert_data_rd_stored: assert property (@(posedge clk) data_rd_stored)

//         else $error("Failed to assert data_rd_stored");

// property Ram_Idle;
//     @(posedge clk) disable iff(!rst_n)
//             ( !rx_valid && !(din[9:8]==2'b11)) |=> ((tx_valid==0));
                     
//     endproperty

//         assert_Ram_Idle: assert property (@(posedge clk) Ram_Idle)

//         else $error("Failed to assert Ram_Idle");


endmodule


