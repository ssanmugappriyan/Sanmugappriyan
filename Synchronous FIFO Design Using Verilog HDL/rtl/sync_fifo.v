module sync_fifo (
    input wire clk,
    input wire rst,

    input wire wr_en,
    input wire rd_en,

    input wire [7:0]data_in,
    output reg [7:0]data_out,

    output wire full,
    output wire empty
);

//Internal memory 
    reg [7:0] memory [0:15];

//Pointers
    reg [3:0]wr_ptr;
    reg [3:0]rd_ptr;

//Internal Variables
    reg [4:0]count;

    assign full = (count == 5'd16);
    assign empty = (count == 5'd0);

    wire do_wr = (wr_en && !full);
    wire do_rd = (rd_en && !empty);

always @(posedge clk) 
begin
    //reset logic
    if (rst)  
    begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        count <= 0;
        data_out <= 0;
    end    

    else
    begin
        if(do_wr)  
        begin
            memory[wr_ptr] <= data_in;
            wr_ptr <= wr_ptr + 1'b1;
        end
        
        if (do_rd)  
        begin
            data_out <= memory[rd_ptr]; 
            rd_ptr <= rd_ptr + 1'b1;    
        end
        case ({do_wr, do_rd})
        2'b00 : count <= count; 
        2'b01 : count <= count - 1'b1; 
        2'b10 : count <= count + 1'b1; 
        2'b11 : count <= count;
        endcase
    end
  
end
endmodule
