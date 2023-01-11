`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/10 14:27:04
// Design Name: 
// Module Name: four_bit_cla_adder
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


module four_bit_cla_adder(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output reg [3:0] r,
    output reg gout,
    output reg pout
    );

wire p0, g0, p1, g1, c1, p2, g2, c2, p3, g3, c3;
wire [3:0] temp_sum;

assign c1 = g0 | (p0 & cin);
assign c2 = g1 | (g0 & p1) | (p1 & p0 & cin);
assign c3 = g2 | (g1 & p2) | (g0 & p1 & p2) | (p2 & p1 & p0 & cin);

full_adder f0(.a(a[0]), .b(b[0]), .cin(cin), .Propagate(p0), .Generate(g0), .Sum(temp_sum[0]));
full_adder f1(.a(a[1]), .b(b[1]), .cin(c1), .Propagate(p1), .Generate(g1), .Sum(temp_sum[1]));
full_adder f2(.a(a[2]), .b(b[2]), .cin(c2), .Propagate(p2), .Generate(g2), .Sum(temp_sum[2]));
full_adder f3(.a(a[3]), .b(b[3]), .cin(c3), .Propagate(p3), .Generate(g3), .Sum(temp_sum[3]));

always@*
begin
    r = temp_sum;
    gout = (g0 & p1 & p2 & p3) | (g1 & p2 & p3) | (g2 & p3) | g3;
    pout = p0 & p1 & p2 & p3;
end

endmodule
