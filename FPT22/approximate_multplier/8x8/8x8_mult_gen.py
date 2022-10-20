# "1" means "LM_1_EC"
# "2" means "LM_2_EC"
# "3" means "LM_3_EC"
# "4" means "LM_NC_1_EC"
# "5" means "LM_NC_2_EC"
# "6" means "LM_NC_3_EC"

matrix = ["1","2","3","4","5","6"]

for i1 in range(0,6):
	for i2 in range (0,6):
		for i3 in range(0,6):
			for i4 in range(0,6):
				for i5 in range(0,6):
					for i6 in range(0,6):
				
						s=matrix[i1]+matrix[i2]+matrix[i3]+matrix[i4]+matrix[i5]+matrix[i6]

						if i1 == 0:
							f = 'LM_1_EC'
						if i1 == 1:
							f = 'LM_2_EC'
						if i1 == 2:
							f = 'LM_3_EC'
						if i1 == 3:
							f = 'LM_NC_1_EC'    
						if i1 == 4:
							f = 'LM_NC_2_EC'
						if i1 == 5:
							f = 'LM_NC_3_EC'

						if i2 == 0:
							e = 'LM_1_EC'
						if i2 == 1:
							e = 'LM_2_EC'
						if i2 == 2:
							e = 'LM_3_EC'
						if i2 == 3:
							e = 'LM_NC_1_EC'    
						if i2 == 4:
							e = 'LM_NC_2_EC'
						if i2 == 5:
							e = 'LM_NC_3_EC'

						if i3 == 0:
							d = 'LM_1_EC'
						if i3 == 1:
							d = 'LM_2_EC'
						if i3 == 2:
							d = 'LM_3_EC'
						if i3 == 3:
							d = 'LM_NC_1_EC'    
						if i3 == 4:
							d = 'LM_NC_2_EC'
						if i3 == 5:
							d = 'LM_NC_3_EC'

						if i4 == 0:
							c = 'LM_1_EC'
						if i4 == 1:
							c = 'LM_2_EC'
						if i4 == 2:
							c = 'LM_3_EC'
						if i4 == 3:
							c = 'LM_NC_1_EC'    
						if i4 == 4:
							c = 'LM_NC_2_EC'
						if i4 == 5:
							c = 'LM_NC_3_EC'

						if i5 == 0:
							b = 'LM_1_EC'
						if i5 == 1:
							b = 'LM_2_EC'
						if i5 == 2:
							b = 'LM_3_EC'
						if i5 == 3:
							b = 'LM_NC_1_EC'    
						if i5 == 4:
							b = 'LM_NC_2_EC'
						if i5 == 5:
							b = 'LM_NC_3_EC'

						if i6 == 0:
							a = 'LM_1_EC'
						if i6 == 1:
							a = 'LM_2_EC'
						if i6 == 2:
							a = 'LM_3_EC'
						if i6 == 3:
							a = 'LM_NC_1_EC'    
						if i6 == 4:
							a = 'LM_NC_2_EC'
						if i6 == 5:
							a = 'LM_NC_3_EC'
						
					

						if i1 <= i2:
							if i2 <= i3:
								if i3 <= i4:
									if i4 <= i5:
										if i5 <= i6:
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

												

					
			    

				
					









				
					







