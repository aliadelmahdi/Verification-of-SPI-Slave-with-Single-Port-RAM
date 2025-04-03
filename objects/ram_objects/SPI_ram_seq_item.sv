package SPI_ram_seq_item_pkg;

import uvm_pkg::*;
`include "uvm_macros.svh"
`include "spi_defines.svh" // For macros
 
    class SPI_ram_seq_item extends uvm_sequence_item;
        rand bit rst_n;

        `uvm_object_utils_begin(SPI_ram_seq_item)
            `uvm_field_int(rst_n, UVM_DEFAULT)
        `uvm_object_utils_end
        function new(string name = "SPI_ram_seq_item");
            super.new(name);
        endfunction
        
    endclass : SPI_ram_seq_item

endpackage : SPI_ram_seq_item_pkg