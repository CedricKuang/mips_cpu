`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/10 19:23:59
// Design Name: 
// Module Name: subtracter
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


module subtracter(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output reg [15:0] r,
    output reg cout
    );

wire flip_b;
wire [15:0] temp_r;
wire [15:0] temp_cout;

assign flip_b = ~b + 1;
// here should be a normal cla adder
sixteen_bit_cla_adder adder_for_subtract(.a(a), .b(flip_b), .cin(cin), .r(temp_r), .cout(temp_cout));

always@*
begin
    if (a >= b) 
    begin
        r = temp_r;
        cout = temp_cout;
    end
    else
    begin // overflow
        r = 0;
        cout = 1;
    end
end

endmodule
