# "1" means "R1"
# "2" means "R2"
# "3" means "N1"
# "4" means "N2"
matrix = ["1","2","3","4"]

for i1 in range(0,4):
	for i2 in range (0,4):
		for i3 in range(0,4):
			for i4 in range(0,4):
				
				s=matrix[i1]+matrix[i2]+matrix[i3]+matrix[i4]

				if i1 == 0:
					d = 'R1_4x4_mul'
				if i1 == 1:
					d = 'R2_4x4_mul'
				if i1 == 2:
					d = 'N1_4x4_mul'
				if i1 == 3:
					d = 'N2_4x4_mul'    
				if i2 == 0:
					c = 'R1_4x4_mul'
				if i2 == 1:
					c = 'R2_4x4_mul'
				if i2 == 2:
					c = 'N1_4x4_mul'
				if i2 == 3:
					c = 'N2_4x4_mul'
				if i3 == 0:
					b = 'R1_4x4_mul'
				if i3 == 1:
					b = 'R2_4x4_mul'
				if i3 == 2:
					b = 'N1_4x4_mul'
				if i3 == 3:
					b = 'N2_4x4_mul'
				if i4 == 0:
					a = 'R1_4x4_mul'
				if i4 == 1:
					a = 'R2_4x4_mul'
				if i4 == 2:
					a = 'N1_4x4_mul'
				if i4 == 3:
					a = 'N2_4x4_mul'

				if i1 <= i2:
					if i2 <= i3:
						if i3 <= i4:
							with open("Mult_8x8_e_%s.v" % s, "w") as fh1:

								fh1.write("module Mult_8x8_e_" + s + "(\n")
								fh1.write("input [7:0] A,\n")
								fh1.write("input [7:0] B,\n")
								fh1.write("output [15:0]R\n")
								fh1.write(");\n")

								fh1.write("wire [7:0]prod1;\n")
								fh1.write("wire [7:0]prod2;\n")
								fh1.write("wire [7:0]prod3;\n")
								fh1.write("wire [7:0]prod4;\n")
								fh1.write("\n")

								fh1.write( a + " M0(.A(A[3:0]),.B(B[3:0]),.R(prod1));\n")
								fh1.write( b + " M1(.A(A[3:0]),.B(B[7:4]),.R(prod2));\n")
								fh1.write( c + " M2(.A(A[7:4]),.B(B[3:0]),.R(prod3));\n")
								fh1.write( d + " M3(.A(A[7:4]),.B(B[7:4]),.R(prod4));\n")
								
								fh1.write("adder adder0(.prod1(prod1),.prod2(prod2),.prod3(prod3),.prod4(prod4),.PROD(R));\n")
																
								fh1.write("endmodule\n")
							with open("Mult_8x8_or_%s.v" % s, "w") as fh2:
								
								fh2.write("module Mult_8x8_or_" + s + "(\n")						
								fh2.write("input [7:0] A,\n")
								fh2.write("input [7:0] B,\n")
								fh2.write("output [15:0]R\n")
								fh2.write(");\n")

								fh2.write("wire [7:0]prod1;\n")
								fh2.write("wire [7:0]prod2;\n")
								fh2.write("wire [7:0]prod3;\n")
								fh2.write("wire [7:0]prod4;\n")
								fh2.write("\n")

								fh2.write( a + " M0(.A(A[3:0]),.B(B[3:0]),.R(prod1));\n")
								fh2.write( b + " M1(.A(A[3:0]),.B(B[7:4]),.R(prod2));\n")
								fh2.write( c + " M2(.A(A[7:4]),.B(B[3:0]),.R(prod3));\n")
								fh2.write( d + " M3(.A(A[7:4]),.B(B[7:4]),.R(prod4));\n")
																							
								fh2.write("OR adder0(.prod1(prod1),.prod2(prod2),.prod3(prod3),.prod4(prod4),.PROD(R));\n")
                                															
								fh2.write("endmodule\n")
							with open("Mult_8x8_orc_%s.v" % s, "w") as fh3:
								
								fh3.write("module Mult_8x8_orc_" + s + "(\n")

								fh3.write("input [7:0] A,\n")
								fh3.write("input [7:0] B,\n")
								fh3.write("output [15:0]R\n")
								fh3.write(");\n")

								fh3.write("wire [7:0]prod1;\n")
								fh3.write("wire [7:0]prod2;\n")
								fh3.write("wire [7:0]prod3;\n")
								fh3.write("wire [7:0]prod4;\n")
								fh3.write("\n")

								fh3.write( a + " M0(.A(A[3:0]),.B(B[3:0]),.R(prod1));\n")
								fh3.write( b + " M1(.A(A[3:0]),.B(B[7:4]),.R(prod2));\n")
								fh3.write( c + " M2(.A(A[7:4]),.B(B[3:0]),.R(prod3));\n")
								fh3.write( d + " M3(.A(A[7:4]),.B(B[7:4]),.R(prod4));\n")
								                                
								fh3.write("OR_C adder0(.prod1(prod1),.prod2(prod2),.prod3(prod3),.prod4(prod4),.PROD(R));\n")
								
								fh3.write("endmodule\n")

					
			    

				
					







