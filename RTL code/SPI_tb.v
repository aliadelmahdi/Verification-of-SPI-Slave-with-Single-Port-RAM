module SPI_tb ();
    reg MOSI,SS_n,clk,rst_n;
    wire MISO;

    // instantiate the design here 
    SPI dut(clk,rst_n,SS_n,MOSI,MISO);
    initial begin
        clk=0;
        forever begin
            #1; clk=~clk;
        end
    end
    initial begin
    $readmemh("mem.dat",dut.m1.mem);
        //test the reset first 
            rst_n=0;
            MOSI=$random;
            SS_n=$random;
            repeat(10)
            @(negedge clk);
        //now test the write operation 
             //1)write address(60)  00 0011 1100
            rst_n=1;
            SS_n=0;
            @(negedge clk);
            MOSI=0; //control bit
            @(negedge clk);
            MOSI=0; //9
            @(negedge clk);
            MOSI=0; //8
            @(negedge clk);
            MOSI=0; //7
            @(negedge clk);
            MOSI=0; //6
            @(negedge clk);
            MOSI=1; //5
            @(negedge clk);
            MOSI=1;  //4
            @(negedge clk);
            MOSI=1;  //3
            @(negedge clk);
            MOSI=1;  //2
            @(negedge clk);
            MOSI=0;  //1
            @(negedge clk);
            MOSI=0;  //0
            @(negedge clk);
            SS_n=1; 
            @(negedge clk);
            //2)write data(100)  01 0110 0100
            SS_n=0;
            @(negedge clk);
            MOSI=0; //control bit
            @(negedge clk);            
            MOSI=0; //9
            @(negedge clk);
            MOSI=1; //8
            @(negedge clk);
            MOSI=0; //7
            @(negedge clk);
            MOSI=1; //6
            @(negedge clk);
            MOSI=1; //5
            @(negedge clk);
            MOSI=0;  //4
            @(negedge clk);
            MOSI=0;  //3
            @(negedge clk);
            MOSI=1;  //2
            @(negedge clk);
            MOSI=0;  //1
            @(negedge clk);
            MOSI=0;  //0
            @(negedge clk);
            SS_n=1;
            @(negedge clk);
        //now test the read operation
            //3)read address(30)  10 0011 1100
            rst_n=1;
            SS_n=0;
            @(negedge clk);
            MOSI=1; //control bit
            @(negedge clk);            
            MOSI=1; //9
            @(negedge clk);
            MOSI=0; //8
            @(negedge clk);
            MOSI=0; //7
            @(negedge clk);
            MOSI=0; //6
            @(negedge clk);
            MOSI=1; //5
            @(negedge clk);
            MOSI=1;  //4
            @(negedge clk);
            MOSI=1;  //3
            @(negedge clk);
            MOSI=1;  //2
            @(negedge clk);
            MOSI=0;  //1
            @(negedge clk);
            MOSI=0;  //0
            @(negedge clk);
            SS_n=1; 
            @(negedge clk);   
            //1)read data (100) 11 0011 1100
            SS_n=0;
            @(negedge clk);
            MOSI=1; //control bit
            @(negedge clk);            
            MOSI=1; //9
            @(negedge clk);
            MOSI=1; //8
            @(negedge clk);
            MOSI=0; //7
            @(negedge clk);
            MOSI=0; //6
            @(negedge clk);
            MOSI=1; //5
            @(negedge clk);
            MOSI=1;  //4
            @(negedge clk);
            MOSI=1;  //3
            @(negedge clk);
            MOSI=1;  //2
            @(negedge clk);
            MOSI=0;  //1
            @(negedge clk);
            MOSI=0;  //0
            @(negedge clk);
            repeat(9) 
            @(negedge clk);//wait for tx_data to be transmitted to MISO
            SS_n=1;
            // now expected to read MISO=100 
            @(negedge clk)
                    //test the reset first 
        //repeating steps with differnet address
        //now test the write operation 
             //1)write address(42)  00 0010 1010
            rst_n=1;
            SS_n=0;
            @(negedge clk);
            MOSI=0; //control bit
            @(negedge clk);
            MOSI=0; //9
            @(negedge clk);
            MOSI=0; //8
            @(negedge clk);
            MOSI=0; //7
            @(negedge clk);
            MOSI=0; //6
            @(negedge clk);
            MOSI=1; //5
            @(negedge clk);
            MOSI=0;  //4
            @(negedge clk);
            MOSI=1;  //3
            @(negedge clk);
            MOSI=0;  //2
            @(negedge clk);
            MOSI=1;  //1
            @(negedge clk);
            MOSI=0;  //0
            @(negedge clk);
            SS_n=1; 
            @(negedge clk);
            //2)write data(53)  01 0011 0101
            SS_n=0;
            @(negedge clk);
            MOSI=0; //control bit
            @(negedge clk);            
            MOSI=0; //9
            @(negedge clk);
            MOSI=1; //8
            @(negedge clk);
            MOSI=0; //7
            @(negedge clk);
            MOSI=0; //6
            @(negedge clk);
            MOSI=1; //5
            @(negedge clk);
            MOSI=1;  //4
            @(negedge clk);
            MOSI=0;  //3
            @(negedge clk);
            MOSI=1;  //2
            @(negedge clk);
            MOSI=0;  //1
            @(negedge clk);
            MOSI=1;  //0
            @(negedge clk);
            SS_n=1;
            @(negedge clk);
        //now test the read operation
            //3)read address(42)  10 0010 1010
            rst_n=1;
            SS_n=0;
            @(negedge clk);
            MOSI=1; //control bit
            @(negedge clk);            
            MOSI=1; //9
            @(negedge clk);
            MOSI=0; //8
            @(negedge clk);
            MOSI=0; //7
            @(negedge clk);
            MOSI=0; //6
            @(negedge clk);
            MOSI=1; //5
            @(negedge clk);
            MOSI=0;  //4
            @(negedge clk);
            MOSI=1;  //3
            @(negedge clk);
            MOSI=0;  //2
            @(negedge clk);
            MOSI=1;  //1
            @(negedge clk);
            MOSI=0;  //0
            @(negedge clk);
            SS_n=1; 
            @(negedge clk);   
            //1)read data (53) 11 1100 1101
            SS_n=0;
            @(negedge clk);
            MOSI=1; //control bit
            @(negedge clk);            
            MOSI=1; //9
            @(negedge clk);
            MOSI=1; //8
            @(negedge clk);
            MOSI=1; //7
            @(negedge clk);
            MOSI=1; //6
            @(negedge clk);
            MOSI=0; //5
            @(negedge clk);
            MOSI=0;  //4
            @(negedge clk);
            MOSI=1;  //3
            @(negedge clk);
            MOSI=1;  //2
            @(negedge clk);
            MOSI=0;  //1
            @(negedge clk);
            MOSI=1;  //0
            @(negedge clk);
            repeat(9) 
            @(negedge clk);//wait for tx_data to be transmitted to MISO
            SS_n=1;
            // now expected to read MISO=100 
    $stop;        
    end
endmodule