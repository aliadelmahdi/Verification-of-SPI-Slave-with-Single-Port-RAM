package SPI_slave_reset_sequence_pkg;

    import uvm_pkg::*,
           SPI_slave_seq_item_pkg::*,
           shared_pkg::*; // For enums and parameters
    `include "uvm_macros.svh"
           
    class SPI_slave_reset_sequence extends uvm_sequence #(SPI_slave_seq_item);

        `uvm_object_utils (SPI_slave_reset_sequence)
        SPI_slave_seq_item slave_seq_item;

        function new (string name = "SPI_slave_reset_sequence");
            super.new(name);
        endfunction

        task body;
            slave_seq_item = SPI_slave_seq_item::type_id::create("slave_seq_item");
            start_item(slave_seq_item);
                slave_seq_item.rst_n = `HIGH;
            finish_item(slave_seq_item);
        endtask
        
    endclass : SPI_slave_reset_sequence

endpackage : SPI_slave_reset_sequence_pkg