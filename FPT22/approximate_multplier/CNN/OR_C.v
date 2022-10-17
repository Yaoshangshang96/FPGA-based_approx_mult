`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2022 07:51:29 PM
// Design Name: 
// Module Name: OR_ASP
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


module OR_C(
input [7:0]prod1,
input [7:0]prod2,
input [7:0]prod3,
input [7:0]prod4,

output [15:0]PROD
    );
    
    LUT6_2 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_2_inst1 (
      .O6(P4), // 1-bit LUT6 output
      .I0(prod1[4]), // 1-bit LUT input
      .I1(prod2[0]), // 1-bit LUT input
      .I2(prod3[0]), // 1-bit LUT input
      .I3(1'b0), // 1-bit LUT input
      .I4(1'b0), // 1-bit LUT input
      .I5(1'b0)  // 1-bit LUT input (fast MUX select only available to O6 output)
   );
   LUT6_2 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_2_inst2 (
      .O6(P5), // 1-bit LUT6 output
      .I0(prod1[5]), // 1-bit LUT input
      .I1(prod2[1]), // 1-bit LUT input
      .I2(prod3[1]), // 1-bit LUT input
      .I3(prod1[4]), // 1-bit LUT input
      .I4(prod2[0]), // 1-bit LUT input
      .I5(prod3[0])  // 1-bit LUT input (fast MUX select only available to O6 output)
   );
   LUT6_2 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_2_inst3 (
      .O6(P6), // 1-bit LUT6 output
      .I0(prod1[6]), // 1-bit LUT input
      .I1(prod2[2]), // 1-bit LUT input
      .I2(prod3[2]), // 1-bit LUT input
      .I3(prod1[5]), // 1-bit LUT input
      .I4(prod2[1]), // 1-bit LUT input
      .I5(prod3[1])  // 1-bit LUT input (fast MUX select only available to O6 output)
   );
   LUT6_2 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_2_inst4 (
      .O6(P7), // 1-bit LUT6 output
      .I0(prod1[7]), // 1-bit LUT input
      .I1(prod2[3]), // 1-bit LUT input
      .I2(prod3[3]), // 1-bit LUT input
      .I3(prod1[6]), // 1-bit LUT input
      .I4(prod2[2]), // 1-bit LUT input
      .I5(prod3[2])  // 1-bit LUT input (fast MUX select only available to O6 output)
   );
   LUT6_2 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_2_inst5 (
      .O6(P8), // 1-bit LUT6 output
      .I0(prod2[4]), // 1-bit LUT input
      .I1(prod3[4]), // 1-bit LUT input
      .I2(prod4[0]), // 1-bit LUT input
      .I3(prod1[7]), // 1-bit LUT input
      .I4(prod2[3]), // 1-bit LUT input
      .I5(prod3[3])  // 1-bit LUT input (fast MUX select only available to O6 output)
   );
   LUT6_2 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_2_inst6 (
      .O6(P9), // 1-bit LUT6 output
      .I0(prod2[5]), // 1-bit LUT input
      .I1(prod3[5]), // 1-bit LUT input
      .I2(prod4[1]), // 1-bit LUT input
      .I3(prod2[4]), // 1-bit LUT input
      .I4(prod3[4]), // 1-bit LUT input
      .I5(prod4[0])  // 1-bit LUT input (fast MUX select only available to O6 output)
   );
   LUT6_2 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_2_inst7 (
      .O6(P10), // 1-bit LUT6 output
      .I0(prod2[6]), // 1-bit LUT input
      .I1(prod3[6]), // 1-bit LUT input
      .I2(prod4[2]), // 1-bit LUT input
      .I3(prod2[5]), // 1-bit LUT input
      .I4(prod3[5]), // 1-bit LUT input
      .I5(prod4[1])// 1-bit LUT input (fast MUX select only available to O6 output)
   );
   LUT6_2 #(
      .INIT(64'hFFFFFFFEFFFEFEFE) // Specify LUT Contents
   ) LUT6_2_inst8 (
      .O6(P11), // 1-bit LUT6 output
      .I0(prod2[7]), // 1-bit LUT input
      .I1(prod3[7]), // 1-bit LUT input
      .I2(prod4[3]), // 1-bit LUT input
      .I3(prod2[6]), // 1-bit LUT input
      .I4(prod3[6]), // 1-bit LUT input
      .I5(prod4[2])  // 1-bit LUT input (fast MUX select only available to O6 output)
   );
  
  assign PROD = {prod4[7],prod4[6],prod4[5],prod4[4],P11,P10,P9,P8,P7,P6,P5,P4,prod1[3],prod1[2],prod1[1],prod1[0]};
endmodule
