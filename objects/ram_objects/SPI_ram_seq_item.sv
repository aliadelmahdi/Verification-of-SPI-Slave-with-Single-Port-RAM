package SPI_ram_seq_item_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"
`include "spi_defines.svh" // For macros
import shared_pkg::*; // For enums and parameters
 
    class SPI_ram_seq_item extends uvm_sequence_item;
        // Input signals
        rand bit rst_n;
        rand bit rx_valid;
        rand bit [MEM_WIDTH+1:0]rx_data;
        
        // Output signals
        logic [MEM_WIDTH-1:0]dout;
        logic tx_valid;

        // Golden model signals
        logic [MEM_WIDTH-1:0]dout_ref;
        logic tx_valid_ref;

        `uvm_object_utils_begin(SPI_ram_seq_item)
            `uvm_field_int(rst_n, UVM_DEFAULT)
            `uvm_field_int(rx_valid, UVM_DEFAULT)
            `uvm_field_int(rx_data, UVM_DEFAULT)
            `uvm_field_int(dout, UVM_DEFAULT)
            `uvm_field_int(dout_ref, UVM_DEFAULT)
            `uvm_field_int(tx_valid, UVM_DEFAULT)
            `uvm_field_int(tx_valid_ref, UVM_DEFAULT)
        `uvm_object_utils_end
        function new(string name = "SPI_ram_seq_item");
            super.new(name);
        endfunction
        
    endclass : SPI_ram_seq_item

endpackage : SPI_ram_seq_item_pkg

