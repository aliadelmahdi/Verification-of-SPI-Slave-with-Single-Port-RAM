import uvm_pkg::*;
import SPI_env_pkg::*;
import SPI_test_pkg::*;
import shared_pkg::*; // For enums and parameters
`include "spi_defines.svh" // For macros
`timescale `TIME_UNIT / `TIME_PRECISION

module tb_top;
    bit clk;
    // Clock Generation
    initial begin
        clk = `LOW;
        forever #(`CLK_PERIOD/2) clk = ~ clk;
    end

   

    SPI_env env_instance; // Instantiate the SPI enviroment
    SPI_test test; // Instantiate the SPI test

    // Instantiate the interface
    SPI_if spi_if (clk);
    
    SPI_slave #(
        .IDLE(spi_if.IDLE),
        .CHK_CMD(spi_if.CHK_CMD),
        .WRITE(spi_if.WRITE),
        .READ_ADD(spi_if.READ_ADD),
        .READ_DATA(spi_if.READ_DATA)
        ) slave (
        .MOSI(spi_if.MOSI),
        .SS_n(spi_if.SS_n),
        .clk(spi_if.clk),
        .rst_n(spi_if.rst_n),
        .MISO(spi_if.MISO),
        //
        .rx_data(spi_if.rx_data),
        .rx_valid(spi_if.rx_valid)
        // .tx_data(spi_if.dout),
        // .tx_valid(spi_if.tx_valid)
    );

    // RAM_Sync_Single_port instantiation
    RAM_Sync_Single_port #(
        .MEM_DEPTH(spi_if.ADDR_SIZE),
        .ADDR_SIZE(spi_if.ADDR_SIZE)
    ) RAM (
        .din(spi_if.rx_data),
        .rx_valid(spi_if.rx_valid),
        .clk(spi_if.clk),
        .rst_n(spi_if.rst_n),
        .dout(spi_if.dout),
        .tx_valid(spi_if.tx_valid)
    );

    golden_model GLD (
        .clk(spi_if.clk)
        );

      
    bind SPI_slave SPI_slave_sva SPI_slave_inst  (
        .MOSI(MOSI),
        .SS_n(SS_n),
        .clk(clk),
        .rst_n(rst_n),
        .MISO(MISO),
        //
        .rx_data(rx_data),
        .rx_valid(rx_valid),
        .tx_data(dout),
        .tx_valid(tx_valid),
        .cs(slave.cs)
    );

    // bind RAM RAM_sva RAM_sva_inst (
    //     .din(rx_data),
    //     .rx_valid(rx_valid),
    //     .clk(clk),
    //     .rst_n(rst_n),
    //     .dout(tx_data),
    //     .tx_valid(tx_valid)
    // );   

    initial begin
        uvm_top.set_report_verbosity_level(UVM_MEDIUM); // Set verbosity level
        uvm_top.finish_on_completion = `DISABLE_FINISH; // Prevent UVM from calling $finish
        uvm_config_db#(virtual SPI_if)::set(null, "*", "spi_if", spi_if); // Set SPI interface globally
        run_test("SPI_test"); // Start the UVM test
        $stop; // Stop simulation after test execution
    end
endmodule : tb_top