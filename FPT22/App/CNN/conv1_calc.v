

/*-------------------------------------------------------------------
 *  Module: conv1_calc
 *------------------------------------------------------------------*/
 
 module conv1_calc #(parameter WIDTH = 28, HEIGHT = 28, DATA_BITS = 8)(
   input valid_out_buf,
   input [DATA_BITS - 1:0] data_out_0, data_out_1, data_out_2, data_out_3, data_out_4,
   data_out_5, data_out_6, data_out_7, data_out_8, data_out_9,
   data_out_10, data_out_11, data_out_12, data_out_13, data_out_14,
   data_out_15, data_out_16, data_out_17, data_out_18, data_out_19,
   data_out_20, data_out_21, data_out_22, data_out_23, data_out_24,
   output signed [11:0] conv_out_1, conv_out_2, conv_out_3,
   output reg valid_out_calc
 );

 localparam FILTER_SIZE = 5;
 localparam CHANNEL_LEN = 3;

 reg signed [DATA_BITS - 1:0] weight_1 [0:FILTER_SIZE * FILTER_SIZE - 1];
 reg signed [DATA_BITS - 1:0] weight_2 [0:FILTER_SIZE * FILTER_SIZE - 1];
 reg signed [DATA_BITS - 1:0] weight_3 [0:FILTER_SIZE * FILTER_SIZE - 1];
 reg signed [DATA_BITS - 1:0] bias [0:CHANNEL_LEN - 1];
 wire signed [DATA_BITS*2 - 1:0] res1 [0:FILTER_SIZE * FILTER_SIZE - 1];
 wire signed [DATA_BITS*2 - 1:0] res2 [0:FILTER_SIZE * FILTER_SIZE - 1];
 wire signed [DATA_BITS*2 - 1:0] res3 [0:FILTER_SIZE * FILTER_SIZE - 1];
 wire signed [19:0] calc_out_1, calc_out_2, calc_out_3;
 wire signed [DATA_BITS:0] exp_data [0:FILTER_SIZE * FILTER_SIZE - 1];
 wire signed [11:0] exp_bias [0:CHANNEL_LEN - 1];
 
 initial begin
   $readmemh("conv1_weight_1.mem", weight_1);
   $readmemh("conv1_weight_2.mem", weight_2);
   $readmemh("conv1_weight_3.mem", weight_3);
   $readmemh("conv1_bias.mem", bias);
 end

assign exp_data[0] = {data_out_0};
 assign exp_data[1] = {data_out_1};
 assign exp_data[2] = {data_out_2};
 assign exp_data[3] = {data_out_3};
 assign exp_data[4] = {data_out_4};
 assign exp_data[5] = {data_out_5};
 assign exp_data[6] = {data_out_6};
 assign exp_data[7] = {data_out_7};
 assign exp_data[8] = {data_out_8};
 assign exp_data[9] = {data_out_9};
 assign exp_data[10] = {data_out_10};
 assign exp_data[11] = {data_out_11};
 assign exp_data[12] = {data_out_12};
 assign exp_data[13] = {data_out_13};
 assign exp_data[14] = {data_out_14};
 assign exp_data[15] = {data_out_15};
 assign exp_data[16] = {data_out_16};
 assign exp_data[17] = {data_out_17};
 assign exp_data[18] = {data_out_18};
 assign exp_data[19] = {data_out_19};
 assign exp_data[20] = {data_out_20};
 assign exp_data[21] = {data_out_21};
 assign exp_data[22] = {data_out_22};
 assign exp_data[23] = {data_out_23};
 assign exp_data[24] = {data_out_24};

 //  Re-calibration of extracted weight data according to MSB
 assign exp_bias[0] = (bias[0][7] == 1) ? {4'b1111, bias[0]} : {4'd0, bias[0]};
 assign exp_bias[1] = (bias[1][7] == 1) ? {4'b1111, bias[1]} : {4'd0, bias[1]};
 assign exp_bias[2] = (bias[2][7] == 1) ? {4'b1111, bias[2]} : {4'd0, bias[2]};
////////////////////////////////////////////
genvar i;

////////////////////1



///////////////////2
/*
assign calc_out_1 = exp_data[0]*weight_1[0] + exp_data[1]*weight_1[1] + exp_data[2]*weight_1[2] + exp_data[3]*weight_1[3] + exp_data[4]*weight_1[4] +
					exp_data[5]*weight_1[5] + exp_data[6]*weight_1[6] + exp_data[7]*weight_1[7] + exp_data[8]*weight_1[8] + exp_data[9]*weight_1[9] +
					exp_data[10]*weight_1[10] + exp_data[11]*weight_1[11] + exp_data[12]*weight_1[12] + exp_data[13]*weight_1[13] + exp_data[14]*weight_1[14] +
					exp_data[15]*weight_1[15] + exp_data[16]*weight_1[16] + exp_data[17]*weight_1[17] + exp_data[18]*weight_1[18] + exp_data[19]*weight_1[19] +
					exp_data[20]*weight_1[20] + exp_data[21]*weight_1[21] +exp_data[22]*weight_1[22] +exp_data[23]*weight_1[23] +exp_data[24]*weight_1[24];
 assign calc_out_2 = exp_data[0]*weight_2[0] + exp_data[1]*weight_2[1] + exp_data[2]*weight_2[2] + exp_data[3]*weight_2[3] + exp_data[4]*weight_2[4] +
					exp_data[5]*weight_2[5] + exp_data[6]*weight_2[6] + exp_data[7]*weight_2[7] + exp_data[8]*weight_2[8] + exp_data[9]*weight_2[9] +
					exp_data[10]*weight_2[10] + exp_data[11]*weight_2[11] + exp_data[12]*weight_2[12] + exp_data[13]*weight_2[13] + exp_data[14]*weight_2[14] +
					exp_data[15]*weight_2[15] + exp_data[16]*weight_2[16] + exp_data[17]*weight_2[17] + exp_data[18]*weight_2[18] + exp_data[19]*weight_2[19] +
					exp_data[20]*weight_2[20] + exp_data[21]*weight_2[21] + exp_data[22]*weight_2[22] +exp_data[23]*weight_2[23] +exp_data[24]*weight_2[24];
 assign calc_out_3 = exp_data[0]*weight_3[0] + exp_data[1]*weight_3[1] + exp_data[2]*weight_3[2] + exp_data[3]*weight_3[3] + exp_data[4]*weight_3[4] + 
					exp_data[5]*weight_3[5] + exp_data[6]*weight_3[6] + exp_data[7]*weight_3[7] + exp_data[8]*weight_3[8] + exp_data[9]*weight_3[9] + 
					exp_data[10]*weight_3[10] + exp_data[11]*weight_3[11] + exp_data[12]*weight_3[12] + exp_data[13]*weight_3[13] + exp_data[14]*weight_3[14] + 
					exp_data[15]*weight_3[15] + exp_data[16]*weight_3[16] + exp_data[17]*weight_3[17] + exp_data[18]*weight_3[18] + exp_data[19]*weight_3[19] + 
					exp_data[20]*weight_3[20] + exp_data[21]*weight_3[21] + exp_data[22]*weight_3[22] + exp_data[23]*weight_3[23] + exp_data[24]*weight_3[24];
*/
generate 
for (i=0;i<25;i=i+1)
     mul_8x16 m(.A(exp_data[i]),.B({weight_1[i]}),.P(res1[i]));
endgenerate

assign calc_out_1 = (res1[0]) + (res1[1]) + (res1[2]) +(res1[3]) +(res1[4]) +
(res1[5]) +(res1[6]) +(res1[7]) +(res1[8]) +(res1[9]) +
(res1[10]) +(res1[11]) +(res1[12]) +(res1[13]) +(res1[14]) +
(res1[15]) +(res1[16]) +(res1[17]) +(res1[18]) +(res1[19]) +
(res1[20]) +(res1[21]) +(res1[22]) +(res1[23]) +(res1[24]);

generate 
for (i=0;i<25;i=i+1)
    mul_8x16 m(.A(exp_data[i]),.B({weight_2[i]}),.P(res2[i]));
endgenerate

assign calc_out_2 = (res2[0]) + (res2[1]) + (res2[2]) +(res2[3]) +(res2[4]) +
(res2[5]) +(res2[6]) +(res2[7]) +(res2[8]) +(res2[9]) +
(res2[10]) +(res2[11]) +(res2[12]) +(res2[13]) +(res2[14]) +
(res2[15]) +(res2[16]) +(res2[17]) +(res2[18]) +(res2[19]) +
(res2[20]) +(res2[21]) +(res2[22]) +(res2[23]) +(res2[24]);


generate 
for (i=0;i<25;i=i+1)
     mul_8x16 m(.A(exp_data[i]),.B({weight_3[i]}),.P(res3[i]));
endgenerate

assign calc_out_3 = (res3[0]) + (res3[1]) + (res3[2]) +(res3[3]) +(res3[4]) +
(res3[5]) +(res3[6]) +(res3[7]) +(res3[8]) +(res3[9]) +
(res3[10]) +(res3[11]) +(res3[12]) +(res3[13]) +(res3[14]) +
(res3[15]) +(res3[16]) +(res3[17]) +(res3[18]) +(res3[19]) +
(res3[20]) +(res3[21]) +(res3[22]) +(res3[23]) +(res3[24]);


////////////////////////////////////////////
 assign conv_out_1 = calc_out_1[19:8] + exp_bias[0];
 assign conv_out_2 = calc_out_2[19:8] + exp_bias[1];
 assign conv_out_3 = calc_out_3[19:8] + exp_bias[2];

 assign valid_out_calc = valid_out_buf;
 
endmodule

