/*------------------------------------------------------------------------
 *
 *  Copyright (c) 2021 by Bo Young Kang, All rights reserved.
 *
 *  File name  : conv2_calc_1.v
 *  Written by : Kang, Bo Young
 *  Written on : Oct 14, 2021
 *  Version    : 21.2
 *  Design     : 2nd Convolution Layer for CNN MNIST dataset
 *               Convolution Sum Calculation - 1st Channel
 *
 *------------------------------------------------------------------------*/

/*-------------------------------------------------------------------
 *  Module: conv2_calc_1
 *------------------------------------------------------------------*/

 module conv2_calc_3(
	input clk,
  input rst_n,
  input valid_out_buf,
	input signed [11:0] data_out1_0, data_out1_1, data_out1_2, data_out1_3, data_out1_4,
	  data_out1_5, data_out1_6, data_out1_7, data_out1_8, data_out1_9,
	  data_out1_10, data_out1_11, data_out1_12, data_out1_13, data_out1_14,
	  data_out1_15, data_out1_16, data_out1_17, data_out1_18, data_out1_19,
	  data_out1_20, data_out1_21, data_out1_22, data_out1_23, data_out1_24,
	
	  data_out2_0, data_out2_1, data_out2_2, data_out2_3, data_out2_4,
	  data_out2_5, data_out2_6, data_out2_7, data_out2_8, data_out2_9,
	  data_out2_10, data_out2_11, data_out2_12, data_out2_13, data_out2_14,
	  data_out2_15, data_out2_16, data_out2_17, data_out2_18, data_out2_19,
	  data_out2_20, data_out2_21, data_out2_22, data_out2_23, data_out2_24,
	
	  data_out3_0, data_out3_1, data_out3_2, data_out3_3, data_out3_4,
	  data_out3_5, data_out3_6, data_out3_7, data_out3_8, data_out3_9,
	  data_out3_10, data_out3_11, data_out3_12, data_out3_13, data_out3_14,
	  data_out3_15, data_out3_16, data_out3_17, data_out3_18, data_out3_19,
	  data_out3_20, data_out3_21, data_out3_22, data_out3_23, data_out3_24,

	  output reg [13:0] conv_out_calc,
  	output reg valid_out_calc
);

wire signed [19:0] calc_out, calc_out_1, calc_out_2, calc_out_3;

reg signed [7:0] weight_1 [0:24];
reg signed [7:0] weight_2 [0:24];
reg signed [7:0] weight_3 [0:24];
 wire signed [11:0] exp_data1 [0:25 - 1];
 wire signed [11:0] exp_data2 [0:25 - 1];
 wire signed [11:0] exp_data3 [0:25 - 1];
 wire signed [19:0] res1 [0:25 - 1];
 wire signed [19:0] res2 [0:25 - 1];
 wire signed [19:0] res3 [0:25 - 1];
initial begin
	$readmemh("conv2_weight_31.mem", weight_1);
	$readmemh("conv2_weight_32.mem", weight_2);
	$readmemh("conv2_weight_33.mem", weight_3);

end

 assign exp_data1[0] = {data_out1_0};
 assign exp_data1[1] = {data_out1_1};
 assign exp_data1[2] = {data_out1_2};
 assign exp_data1[3] = {data_out1_3};
 assign exp_data1[4] = {data_out1_4};
 assign exp_data1[5] = {data_out1_5};
 assign exp_data1[6] = {data_out1_6};
 assign exp_data1[7] = {data_out1_7};
 assign exp_data1[8] = {data_out1_8};
 assign exp_data1[9] = {data_out1_9};
 assign exp_data1[10] = {data_out1_10};
 assign exp_data1[11] = {data_out1_11};
 assign exp_data1[12] = {data_out1_12};
 assign exp_data1[13] = {data_out1_13};
 assign exp_data1[14] = {data_out1_14};
 assign exp_data1[15] = {data_out1_15};
 assign exp_data1[16] = {data_out1_16};
 assign exp_data1[17] = {data_out1_17};
 assign exp_data1[18] = {data_out1_18};
 assign exp_data1[19] = {data_out1_19};
 assign exp_data1[20] = {data_out1_20};
 assign exp_data1[21] = {data_out1_21};
 assign exp_data1[22] = {data_out1_22};
 assign exp_data1[23] = {data_out1_23};
 assign exp_data1[24] = {data_out1_24};

assign exp_data2[0] = {data_out2_0};
 assign exp_data2[1] = {data_out2_1};
 assign exp_data2[2] = {data_out2_2};
 assign exp_data2[3] = {data_out2_3};
 assign exp_data2[4] = {data_out2_4};
 assign exp_data2[5] = {data_out2_5};
 assign exp_data2[6] = {data_out2_6};
 assign exp_data2[7] = {data_out2_7};
 assign exp_data2[8] = {data_out2_8};
 assign exp_data2[9] = {data_out2_9};
 assign exp_data2[10] = {data_out2_10};
 assign exp_data2[11] = {data_out2_11};
 assign exp_data2[12] = {data_out2_12};
 assign exp_data2[13] = {data_out2_13};
 assign exp_data2[14] = {data_out2_14};
 assign exp_data2[15] = {data_out2_15};
 assign exp_data2[16] = {data_out2_16};
 assign exp_data2[17] = {data_out2_17};
 assign exp_data2[18] = {data_out2_18};
 assign exp_data2[19] = {data_out2_19};
 assign exp_data2[20] = {data_out2_20};
 assign exp_data2[21] = {data_out2_21};
 assign exp_data2[22] = {data_out2_22};
 assign exp_data2[23] = {data_out2_23};
 assign exp_data2[24] = {data_out2_24};
 
 assign exp_data3[0] = {data_out3_0};
 assign exp_data3[1] = {data_out3_1};
 assign exp_data3[2] = {data_out3_2};
 assign exp_data3[3] = {data_out3_3};
 assign exp_data3[4] = {data_out3_4};
 assign exp_data3[5] = {data_out3_5};
 assign exp_data3[6] = {data_out3_6};
 assign exp_data3[7] = {data_out3_7};
 assign exp_data3[8] = {data_out3_8};
 assign exp_data3[9] = {data_out3_9};
 assign exp_data3[10] = {data_out3_10};
 assign exp_data3[11] = {data_out3_11};
 assign exp_data3[12] = {data_out3_12};
 assign exp_data3[13] = {data_out3_13};
 assign exp_data3[14] = {data_out3_14};
 assign exp_data3[15] = {data_out3_15};
 assign exp_data3[16] = {data_out3_16};
 assign exp_data3[17] = {data_out3_17};
 assign exp_data3[18] = {data_out3_18};
 assign exp_data3[19] = {data_out3_19};
 assign exp_data3[20] = {data_out3_20};
 assign exp_data3[21] = {data_out3_21};
 assign exp_data3[22] = {data_out3_22};
 assign exp_data3[23] = {data_out3_23};
 assign exp_data3[24] = {data_out3_24};
/*
assign calc_out_1 = data_out1_0*weight_1[0] + data_out1_1*weight_1[1] + data_out1_2*weight_1[2] + data_out1_3*weight_1[3] + data_out1_4*weight_1[4] + 
					data_out1_5*weight_1[5] + data_out1_6*weight_1[6] + data_out1_7*weight_1[7] + data_out1_8*weight_1[8] + data_out1_9*weight_1[9] + 
					data_out1_10*weight_1[10] + data_out1_11*weight_1[11] + data_out1_12*weight_1[12] + data_out1_13*weight_1[13] + data_out1_14*weight_1[14] + 
					data_out1_15*weight_1[15] + data_out1_16*weight_1[16] + data_out1_17*weight_1[17] + data_out1_18*weight_1[18] + data_out1_19*weight_1[19] + 
					data_out1_20*weight_1[20] + data_out1_21*weight_1[21] + data_out1_22*weight_1[22] + data_out1_23*weight_1[23] + data_out1_24*weight_1[24];

assign calc_out_2 = data_out2_0*weight_2[0] + data_out2_1*weight_2[1] + data_out2_2*weight_2[2] + data_out2_3*weight_2[3] + data_out2_4*weight_2[4] + 
					data_out2_5*weight_2[5] + data_out2_6*weight_2[6] + data_out2_7*weight_2[7] + data_out2_8*weight_2[8] + data_out2_9*weight_2[9] + 
					data_out2_10*weight_2[10] + data_out2_11*weight_2[11] + data_out2_12*weight_2[12] + data_out2_13*weight_2[13] + data_out2_14*weight_2[14] + 
					data_out2_15*weight_2[15] + data_out2_16*weight_2[16] + data_out2_17*weight_2[17] + data_out2_18*weight_2[18] + data_out2_19*weight_2[19] + 
					data_out2_20*weight_2[20] + data_out2_21*weight_2[21] + data_out2_22*weight_2[22] + data_out2_23*weight_2[23] + data_out2_24*weight_2[24];

assign calc_out_3 = data_out3_0*weight_3[0] + data_out3_1*weight_3[1] + data_out3_2*weight_3[2] + data_out3_3*weight_3[3] + data_out3_4*weight_3[4] + 
					data_out3_5*weight_3[5] + data_out3_6*weight_3[6] + data_out3_7*weight_3[7] + data_out3_8*weight_3[8] + data_out3_9*weight_3[9] + 
					data_out3_10*weight_3[10] + data_out3_11*weight_3[11] + data_out3_12*weight_3[12] + data_out3_13*weight_3[13] + data_out3_14*weight_3[14] + 
					data_out3_15*weight_3[15] + data_out3_16*weight_3[16] + data_out3_17*weight_3[17] + data_out3_18*weight_3[18] + data_out3_19*weight_3[19] + 
					data_out3_20*weight_3[20] + data_out3_21*weight_3[21] + data_out3_22*weight_3[22] + data_out3_23*weight_3[23] + data_out3_24*weight_3[24];
*/

genvar i;

generate 
for (i=0;i<25;i=i+1)
        mul_24x24 m(.A(exp_data1[i]),.B({weight_1[i]}),.P(res1[i]));
endgenerate

assign calc_out_1 = (res1[0]) + (res1[1]) + (res1[2]) +(res1[3]) +(res1[4]) +
(res1[5]) +(res1[6]) +(res1[7]) +(res1[8]) +(res1[9]) +
(res1[10]) +(res1[11]) +(res1[12]) +(res1[13]) +(res1[14]) +
(res1[15]) +(res1[16]) +(res1[17]) +(res1[18]) +(res1[19]) +
(res1[20]) +(res1[21]) +(res1[22]) +(res1[23]) +(res1[24]);

generate 
for (i=0;i<25;i=i+1)
        mul_24x24 m(.A(exp_data2[i]),.B({weight_2[i]}),.P(res2[i]));
endgenerate

assign calc_out_2 = (res2[0]) + (res2[1]) + (res2[2]) +(res2[3]) +(res2[4]) +
(res2[5]) +(res2[6]) +(res2[7]) +(res2[8]) +(res2[9]) +
(res2[10]) +(res2[11]) +(res2[12]) +(res2[13]) +(res2[14]) +
(res2[15]) +(res2[16]) +(res2[17]) +(res2[18]) +(res2[19]) +
(res2[20]) +(res2[21]) +(res2[22]) +(res2[23]) +(res2[24]);


generate 
for (i=0;i<25;i=i+1)
        mul_24x24 m(.A(exp_data3[i]),.B({weight_3[i]}),.P(res3[i]));
endgenerate

assign calc_out_3 = (res3[0]) + (res3[1]) + (res3[2]) +(res3[3]) +(res3[4]) +
(res3[5]) +(res3[6]) +(res3[7]) +(res3[8]) +(res3[9]) +
(res3[10]) +(res3[11]) +(res3[12]) +(res3[13]) +(res3[14]) +
(res3[15]) +(res3[16]) +(res3[17]) +(res3[18]) +(res3[19]) +
(res3[20]) +(res3[21]) +(res3[22]) +(res3[23]) +(res3[24]);

assign calc_out = calc_out_1 + calc_out_2 + calc_out_3;

//assign conv_out_calc = calc_out[19:6]; // 14bit

always @ (posedge clk) begin
	if(~rst_n) begin
		valid_out_calc <= 0;
    conv_out_calc <= 0;
	end
	else begin
		// Toggling Valid Output Signal
		if(valid_out_buf == 1) begin
			if(valid_out_calc == 1)
				valid_out_calc <= 0;
			else
				valid_out_calc <= 1;
		end
		conv_out_calc = calc_out[19:6];
	end
end

endmodule