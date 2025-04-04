package SPI_slave_seq_item_pkg;

    import uvm_pkg::*,
           shared_pkg::*; // For enums and parameters
    `include "uvm_macros.svh"
    `include "spi_defines.svh" // For macros

    class SPI_slave_seq_item extends uvm_sequence_item;
        // Input signals
        rand bit rst_n;
        rand bit SS_n;
        rand bit tx_valid;
        rand bit MOSI;
        rand bit [7:0]dout;

        // RTL output signals
        logic rx_valid;
        logic MISO;
        logic rx_data;

        // logic [7:0] dout == tx_data
        // logic [9:0] rx_data == din
        // Golden model output signals
        logic rx_valid_ref;
        logic MISO_ref;
        logic rx_data_ref;

        // Default Constructor
        function new(string name = "SPI_slave_seq_item");
            super.new(name);
        endfunction

        `uvm_object_utils_begin(SPI_slave_seq_item)
            `uvm_field_int(rst_n, UVM_DEFAULT)
            `uvm_field_int(SS_n, UVM_DEFAULT)
            `uvm_field_int(tx_valid, UVM_DEFAULT)
            `uvm_field_int(MOSI, UVM_DEFAULT)
            `uvm_field_int(dout, UVM_DEFAULT)
            `uvm_field_int(rx_valid, UVM_DEFAULT)
            `uvm_field_int(rx_valid_ref, UVM_DEFAULT)
            `uvm_field_int(MISO, UVM_DEFAULT)
            `uvm_field_int(MISO_ref, UVM_DEFAULT)
            `uvm_field_int(rx_data, UVM_DEFAULT)
            `uvm_field_int(rx_data_ref, UVM_DEFAULT)
        `uvm_object_utils_end

    endclass : SPI_slave_seq_item

endpackage : SPI_slave_seq_item_pkg