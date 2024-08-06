vlib work
vlog RAM.v FSM.v SPI_tb.v
vsim -voptargs=+acc SPI_tb
add wave -position insertpoint  \
sim:/SPI_tb/MOSI \
sim:/SPI_tb/SS_n \
sim:/SPI_tb/clk \
sim:/SPI_tb/rst_n \
sim:/SPI_tb/MISO \
sim:/SPI_tb/dut/tx_valid \
sim:/SPI_tb/dut/tx_data \
sim:/SPI_tb/dut/rx_valid \
sim:/SPI_tb/dut/rx_data \
sim:/SPI_tb/dut/counter \
sim:/SPI_tb/dut/read_address_received \
sim:/SPI_tb/dut/cs \
sim:/SPI_tb/dut/ns \
sim:/SPI_tb/dut/m1/addr_rd \
sim:/SPI_tb/dut/m1/addr_wr \
sim:/SPI_tb/dut/m1/mem
run -all
#quit -sim