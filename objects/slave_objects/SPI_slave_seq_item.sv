package SPI_slave_seq_item_pkg;

    import uvm_pkg::*,
           shared_pkg::*; // For enums and parameters
    `include "uvm_macros.svh"
    `include "spi_defines.svh" // For macros

    class SPI_slave_seq_item extends uvm_sequence_item;
        rand bit rst_n;

        // Default Constructor
        function new(string name = "SPI_slave_seq_item");
            super.new(name);
        endfunction

        `uvm_object_utils_begin(SPI_slave_seq_item)
            `uvm_field_int(rst_n, UVM_DEFAULT)
        `uvm_object_utils_end

    endclass : SPI_slave_seq_item

endpackage : SPI_slave_seq_item_pkg