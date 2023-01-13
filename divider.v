`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/12 14:50:34
// Design Name: 
// Module Name: divider
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


module divider(
    input [15:0] a,
    input [15:0] b,
    output reg [15:0] q,
    output reg [15:0] r
    );
    
integer i;
integer remainder;
reg [31:0] divisor;

always@*
begin
    remainder = a;
    divisor = { b, 16'b0 };
    q = 0;
    for (i = 0; i <= 16; i = i + 1)
    begin
        remainder = remainder - divisor;
        if (remainder >= 0)
        begin
            q = q << 1;
            q[0] = 1;
        end
        else
        begin
            remainder = remainder + divisor;
            q = q << 1;
            q[0] = 0;
        end
        divisor = divisor >> 1;
    end
    r = remainder;
end

endmodule
