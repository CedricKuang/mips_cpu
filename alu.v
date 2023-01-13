`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/01/12 15:57:34
// Design Name: 
// Module Name: alu
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


module alu(
    input [15:0] a,
    input [15:0] b,
    input [2:0] op,
    output reg [15:0] r
    );
    
wire [15:0] add_result;
wire [15:0] sub_result;
wire [15:0] mul_result;
wire [15:0] div_result;
wire carry, remainder;

sixteen_bit_cla_adder adder(.a(a), .b(b), .cin(1'b0), .r(add_result), .cout(carry));
subtracter subtracter(.a(a), .b(b), .cin(1'b0), .r(sub_result), .cout(carry));
multiplier multiplier(.a(a), .b(b), .r(mul_result));
divider divider(.a(a), .b(b), .q(div_result), .r(remainder));

always@*
begin
    case(op)
        3'b000:
        begin
            r = 16'b0;
        end
        3'b001:
        begin
            r = add_result;
        end
        3'b010:
        begin
            r = sub_result;
        end
        3'b011:
        begin
            r = mul_result;
        end
        3'b100:
        begin
            r = div_result;
        end
        default: r = 16'b0;
    endcase
end

endmodule
