`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/10 19:38:56
// Design Name: 
// Module Name: multiplier
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


module multiplier(
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] r
    );

reg [31:0] extend_r;
reg [31:0] extend_a;
wire [15:0] zeros;
integer i;

assign zeros = 16'b0;

always@*
begin
    extend_r = 0;
    extend_a = { zeros, a };
    for (i = 0; i <= 16; i = i + 1)
    begin
        if (b[i] == 1)
        begin
            extend_r = extend_r + extend_a;
        end
        extend_a = extend_a << 1;
    end
    r = extend_r[15:0];
end

endmodule
