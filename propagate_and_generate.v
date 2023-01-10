`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/10 14:19:37
// Design Name: 
// Module Name: propagate_and_generate
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


module full_adder(
    input a,
    input b,
    input cin,
    output reg Propagate,
    output reg Generate,
    output reg Sum
    );

always@*
begin
    Propagate = a ^ b;
    Generate = a & b;    
    Sum = cin ^ (a ^ b);
end

endmodule
