`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/10 15:46:08
// Design Name: 
// Module Name: sixteen_bit_cla_adder
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


module sixteen_bit_cla_adder(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output reg [15:0] r,
    output reg cout
    );
    
wire [3:0] a0;
wire [3:0] a1;
wire [3:0] a2;
wire [3:0] a3;
wire [3:0] b0;
wire [3:0] b1;
wire [3:0] b2;
wire [3:0] b3;
wire gw, gx, gy, gz;
wire pw, px, py, pz;
wire c4, c8, c12;
wire [3:0]r4;
wire [3:0]r8; 
wire [3:0]r12; 
wire [3:0]r16;

assign a0 = a[3:0];
assign a1 = a[7:4];
assign a2 = a[11:8];
assign a3 = a[15:12];
assign b0 = b[3:0];
assign b1 = b[7:4];
assign b2 = b[11:8];
assign b3 = b[15:12];

four_bit_cla_adder fb0(.a(a0), .b(b0), .cin(cin), .r(r4), .gout(gw), .pout(pw));
four_bit_cla_adder fb1(.a(a1), .b(b1), .cin(c4), .r(r8), .gout(gx), .pout(px));
four_bit_cla_adder fb2(.a(a2), .b(b2), .cin(c8), .r(r12), .gout(gy), .pout(py));
four_bit_cla_adder fb3(.a(a3), .b(b3), .cin(c12), .r(r16), .gout(gz), .pout(pz));

assign c4 = gw | (cin & pw);
assign c8 = gx | (gw & px) | (cin & pw & px);
assign c12 = gy | (gx & py) | (gw & px & py) | (cin & pw & px & py);

always@*
begin
r = { r16, r12, r8, r4 };
cout = gz | (gy & pz) | (gx & py & pz) | (gw & px & py & pz) | (cin & pw & px & py & pz);
end

endmodule
