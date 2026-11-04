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
       rst = 1;
       wr_en = 0;
       rd_en = 0;
       data_in = 0;
       #20;

       rst = 0;
       #10;

       wr_en = 1; // write
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
