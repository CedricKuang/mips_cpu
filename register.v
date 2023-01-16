`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/16 15:39:55
// Design Name: 
// Module Name: register
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


module register(
    input [3:0] read_reg_1,
    input [3:0] read_reg_2,
    input [3:0] write_reg,
    input [15:0] write_data,
    input reg_write,
    input clk,
    input rst,
    output reg [15:0] read_data_1,
    output reg [15:0] read_data_2
    );

reg [15:0] registers[15:0];

always@(posedge clk or posedge rst)
begin
    if (rst)
    begin
        read_data_1 <= 0;
        read_data_2 <= 0;
    end
    else
    begin
        if (reg_write)
        begin
            registers[write_reg] <= write_data;
            read_data_1 <= 0;
            read_data_2 <= 0;
        end
        else
        begin
            read_data_1 <= registers[read_reg_1];
            read_data_2 <= registers[read_reg_2];
        end
    end
end

endmodule
