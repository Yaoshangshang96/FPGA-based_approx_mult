module mult_8x8_1133(
input [7:0] A,
input [7:0] B,
output [15:0]R
);
wire [7:0]prod1;
wire [7:0]prod2;
wire [7:0]prod3;
wire [7:0]prod4;

LM-3 M0(.A(A[3:0]),.B(B[3:0]),.R(prod1));
LM-3 M1(.A(A[3:0]),.B(B[7:4]),.R(prod2));
LM-1 M2(.A(A[7:4]),.B(B[3:0]),.R(prod3));
LM-1 M3(.A(A[7:4]),.B(B[7:4]),.R(prod4));
approx_adder adder0(.prod1(prod1),.prod2(prod2),.prod3(prod3),.prod4(prod4),.PROD(R));
endmodule
