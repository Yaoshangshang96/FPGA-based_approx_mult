`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/23 08:37:58
// Design Name: 
// Module Name: approx_8x8
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


module approx_8x8(
input [7:0]A,
input [7:0]B,

output [15:0]P
    );
    wire [15:0]P_1;
      Mult_8x8_e_111111 M(.A(A),.B(B),.R(P)); //change this module name
   // assign P = A * B;
    
endmodule
