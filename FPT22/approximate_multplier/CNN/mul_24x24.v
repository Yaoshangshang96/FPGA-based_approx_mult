`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/23 09:01:10
// Design Name: 
// Module Name: mul_24x24
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


module mul_24x24(
input [11:0]A,
input [7:0]B,

output [19:0]P
    );
    
    wire [23:0]A_t;
    wire [23:0]B_t;
    wire [15:0]R[0:8];
    wire [63:0]P_t;
    
    assign A_t = {{12{A[11]}},A};
    assign B_t = {{16{B[7]}},B};
    
    //assign R[0] = A_t[7:0] * B_t[7:0];
    assign R[1] = A_t[15:8] * B_t[7:0];
    assign R[2] = A_t[23:16] * B_t[7:0];
    assign R[3] = A_t[7:0] * B_t[15:8];
    assign R[4] = A_t[15:8] * B_t[15:8];
    assign R[5] = A_t[23:16] * B_t[15:8];
    assign R[6] = A_t[7:0] * B_t[23:16];
    assign R[7] = A_t[15:8] * B_t[23:16];
    assign R[8] = A_t[23:16] * B_t[23:16];
    
    approx_8x8 m0(.A(A_t[7:0]),.B(B_t[7:0]),.P(R[0]));
    //approx_8x8 m1(.A(A_t[15:8]),.B(B_t[7:0]),.P(R[1]));
    //approx_8x8 m2(.A(A_t[23:16]),.B(B_t[7:0]),.P(R[2]));
    //approx_8x8 m3(.A(A_t[7:0]),.B(B_t[15:8]),.P(R[3]));
    //approx_8x8 m4(.A(A_t[15:8]),.B(B_t[15:8]),.P(R[4]));
    //approx_8x8 m5(.A(A_t[23:16]),.B(B_t[15:8]),.P(R[5]));
    //approx_8x8 m6(.A(A_t[7:0]),.B(B_t[23:16]),.P(R[6]));
    //approx_8x8 m7(.A(A_t[15:8]),.B(B_t[23:16]),.P(R[7]));
    //approx_8x8 m8(.A(A_t[23:16]),.B(B_t[23:16]),.P(R[8]));
    
    assign P_t = {48'b0,R[0]} + {40'b0,R[1],8'b0} + {32'b0,R[2],16'b0} + {40'b0,R[3],8'b0} + {32'b0,R[4],16'b0} + {24'b0,R[5],24'b0} + {32'b0,R[6],16'b0} + {24'b0,R[7],24'b0} + {16'b0,R[8],32'b0};
    assign P = P_t[19:0];
    
    
endmodule
