`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/22 22:29:03
// Design Name: 
// Module Name: Approx_mul
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


module mul_8x16(
input [7:0]A,
input [7:0]B,

output [15:0]P
    );
    wire [15:0] P_L;
    wire [15:0] P_H;
    //approx_8x8 m0(.A(A),.B({8{B[7]}}),.P(P_H));
    approx_8x8 m1(.A(A),.B(B),.P(P_L));
    assign P_H = A * {8{B[7]}};
    //assign P_L = A * B;
    assign P = {P_H,8'b0} + P_L;
    
endmodule
