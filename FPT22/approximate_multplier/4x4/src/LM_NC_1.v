`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/10 18:27:52
// Design Name: 
// Module Name: N1_4x4_mul
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


module LM_NC_1(
input [3:0] A,
input [3:0] B,

output [7:0]R
    );
    
    
    
    LUT6_2 #(
      .INIT(64'hF888F888C0C0C0C0) 
   ) LUT6_2_inst0 (
      .O6(P1),
      .O5(P0),
      .I0(B[1]), 
      .I1(A[0]),
      .I2(B[0]), 
      .I3(A[1]), 
      .I4(1'b1), 
      .I5(1'b1)  
   );
   
   LUT6_2 #(
      .INIT(64'hFFFF_F888_F888_F888)  
   ) LUT6_2_inst2 (
      .O6(P2), 
      .O5(), 
      .I0(B[1]), 
      .I1(A[1]), 
      .I2(B[2]), 
      .I3(A[0]), 
      .I4(B[0]), 
      .I5(A[2])  
   );
   
    LUT6_2 #(
      .INIT(64'hFFFF_F080_F000_F000)
   ) LUT6_2_inst3 (
      .O6(S), 
      .O5(), 
      .I0(A[0]), 
      .I1(B[0]), 
      .I2(B[2]), 
      .I3(A[1]), 
      .I4(B[1]),
      .I5(A[2]) 
   );
   
   LUT6_2 #(
      .INIT(64'hFFFF_F888_FFFF_F888) 
   ) LUT6_2_inst4 (
      .O6(P3), 
      .O5(), 
      .I0(B[3]), 
      .I1(A[0]), 
      .I2(B[0]), 
      .I3(A[3]), 
      .I4(S), 
      .I5(1'b1)  
   );
   
   LUT6_2 #(
      .INIT(64'hFFFF_F888_F888_F888) //DFFF .. 7888
      //.INIT(64'hFFFF_F888_F888_F888)
   ) LUT6_2_inst5 (
      .O6(P4), 
      .O5(), 
      .I0(B[3]), 
      .I1(A[1]), 
      .I2(B[1]), 
      .I3(A[3]), 
      .I4(B[2]),
      .I5(A[2]) 
   );
   
    LUT6_2 #(
      .INIT(64'hFFFF_F080_F000_F000) 
      //.INIT(64'hFFFF_F080_F000_F000)
   ) LUT6_2_inst7 (
      .O6(P5), 
      .O5(), 
      .I0(A[1]), 
      .I1(B[1]),
      .I2(B[3]), 
      .I3(A[2]), 
      .I4(B[2]),
      .I5(A[3]) 
   );
   
   LUT6_2 #(
      .INIT(64'h0888088880008000) 
   ) LUT6_2_inst8 (
      .O6(P6), 
      .O5(P7), 
      .I0(B[3]), 
      .I1(A[3]), 
      .I2(B[2]), 
      .I3(A[2]), 
      .I4(1'b1), 
      .I5(1'b1)  
   );
   
   assign R = {P7,P6,P5,P4,P3,P2,P1,P0};
endmodule
