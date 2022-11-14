`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/05/11 18:50:47
// Design Name: 
// Module Name: tb_x
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


module pixel_mult(

    );
    reg [7:0] mem0 [262143:0];
    reg [7:0] mem1 [262143:0];
    reg [15:0] mem_r [262143:0];
    reg [2:0]fid;
    reg [20:0]i;
    reg [20:0]j;
    reg [7:0]a;
    reg [7:0]b;
    wire [15:0]r;
      initial
      begin
      $readmemh("C:/workspace/.../512_512_1.txt",mem0);
      $readmemh("C:/workspace/.../512_512_1_.txt",mem1);
      fid = $fopen("C:/Users/surface/Desktop/mat/1.txt");
      for(i = 0;i < 512 * 512;i = i + 1)
      begin
      a = mem0[i];
      b = mem1[i];
      #0.001
      mem_r[i] = r;
      $fwrite(fid,"%h ",mem_r[i]);
      end
      j=261325;
      repeat(819)
      begin
      $fwrite(fid,"%h ",mem_r[j]);
      j = j + 1;
      end
      end
      Mult_8x8_e_1111 MUL(.A(a),.B(b),.R(r));
    endmodule
