`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/16 14:57:32
// Design Name: 
// Module Name: instruction_decoder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module instruction_decoder(
    input [9:0] read_address,
    input clk,
    input rst,
    output reg [3:0] read_reg_1,
    output reg [3:0] read_reg_2,
    output reg [3:0] write_reg,
    output reg [3:0] op
    );

reg [15:0] ram[1023:0];
wire [15:0] curr_inst;
assign curr_inst = ram[read_address];

parameter MEM_INIT_FILE = "ins.txt";
initial begin
  if (MEM_INIT_FILE == "ins.txt") begin
    $readmemh(MEM_INIT_FILE, ram);
  end
end

// go to the read address, read the instruction and decode it
always@(posedge clk or posedge rst)
begin
    if (rst)
    begin
        read_reg_1 <= 4'b0000;
        read_reg_2 <= 4'b0000;
        write_reg <= 4'b0000;
        op <= 4'b0000;
    end
    else
    begin
        read_reg_1 <= curr_inst[15:12];
        read_reg_2 <= curr_inst[11:8];
        write_reg <= curr_inst[7:4];
        op <= curr_inst[3:0];
    end
end

endmodule
