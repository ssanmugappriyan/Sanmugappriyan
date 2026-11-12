`timescale 1ns/1ps
module tb_sync_fifo;
    reg clk;
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [7:0]data_in;
    
    wire [7:0]data_out;
    wire full;
    wire empty;

   integer i;
    sync_fifo uut(
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .data_in(data_in),
        .data_out(data_out),
        .full(full),
        .empty(empty)
    );

    initial 
    begin
       clk = 0;
       forever #5 clk = ~ clk;
    end

    initial
    begin
        // reset test
       rst = 1;
       wr_en = 0;
       rd_en = 0;
       data_in = 0;
       #20;

       rst = 0;
       #10;

       //single write and read test
       wr_en = 1; 
       data_in = 8'hA5;
       #10;

       wr_en = 0;
       #10;

       rd_en = 1;
       #10;
       
       rd_en = 0;
       #10;

       if (data_out == 8'hA5) 
       begin
        $display("Pass: FIFO read correct data");        
       end

       else
       begin
        $display("Fail: Expected A5, got %h", data_out);
       end

       if(empty == 1'b1)
       begin
        $display("Pass: FIFO is empty");
       end

       else
       begin
        $display("Fail: FIFO should be Empty");
       end

       //multiple write and read test
       for (i = 0; i < 16; i = i + 1)
       begin
        @(negedge clk);
        wr_en= 1;
        data_in = i;
       end

       @(negedge clk);
       wr_en = 0;

       //full flag test
       if(full == 1'b1)
       begin
        $display("Pass: Full Flag");
       end
       else 
       begin
        $display("Fail: Error on Full Flag");
       end

       //Multiple read test
       rd_en = 1;
       for(i = 0; i < 16; i = i + 1)
       begin
         @(negedge clk);
         @(posedge clk);
         #1;

         if (data_out == i)
         begin
            $display("Pass: Multiple Read");
         end
         else
         begin
            $display("Fail: Multiple Read");
         end
       end

       @(negedge clk);
       rd_en = 0;

       //empty flag test
       if(empty == 1'b1)
       begin
        $display("Pass: Empty Flag");
       end
       else 
       begin
        $display("Fail: Error on Empty Flag");
       end


    $finish;

    end
    initial 
    begin
        $dumpfile("sync_fifo.vcd");
        $dumpvars(0, tb_sync_fifo);
        $monitor("Time= %0t | clk = %b | rst = %b | wr_en = %b | rd_en = %b | data_in = %b | data_out = %b | full = %b | empty = %b",
        $time, clk, rst, wr_en, rd_en, data_in, data_out, full, empty);  
    end
endmodule
