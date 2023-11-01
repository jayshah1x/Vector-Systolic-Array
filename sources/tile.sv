`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2022 19:20:04
// Design Name: 
// Module Name: tile
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

//(*use_dsp = "no"*)
module tile(clk,input_left0,input_left1,input_left2,input_left3,input_left4,input_top0,input_top1,input_top2,input_top3,input_top4,enable,is_compute_done,is_row_done,conv1,conv2,conv3,
            out_b_5, out_b_4, out_b_3, out_r_4, out_r_3);
    
    parameter MATRIX_SIZE = 3;
    parameter ARRAY_SIZE = 2 * MATRIX_SIZE - 1;
    parameter REG_WIDTH = 16; // system type
    parameter DATA_WIDTH = 16;
    
    input clk;
    input [DATA_WIDTH-1:0] input_left0[7:0];
    input [DATA_WIDTH-1:0] input_left1[7:0];
    input [DATA_WIDTH-1:0] input_left2[7:0];
    input [DATA_WIDTH-1:0] input_left3[7:0];
    input [DATA_WIDTH-1:0] input_left4[7:0];
    input [DATA_WIDTH-1:0] input_top0[7:0];
    input [DATA_WIDTH-1:0] input_top1[7:0];
    input [DATA_WIDTH-1:0] input_top2[7:0];
    input [DATA_WIDTH-1:0] input_top3[7:0];
    input [DATA_WIDTH-1:0] input_top4[7:0]; 
    input enable,is_compute_done,is_row_done;
    
    output [DATA_WIDTH-1:0] conv1[7:0];
    output [DATA_WIDTH-1:0] conv2[7:0];
    output [DATA_WIDTH-1:0] conv3[7:0];
    
    /*
    wire [DATA_WIDTH-1:0] out_b_5[7:0];
    wire [DATA_WIDTH-1:0] out_b_4[7:0];
    wire [DATA_WIDTH-1:0] out_b_3[7:0];
    wire [DATA_WIDTH-1:0] out_r_4[7:0];
    wire [DATA_WIDTH-1:0] out_r_3[7:0];
    */
    
    //For debug purpose only
    output [DATA_WIDTH-1:0] out_b_5[7:0];
    output [DATA_WIDTH-1:0] out_b_4[7:0];
    output [DATA_WIDTH-1:0] out_b_3[7:0];
    output [DATA_WIDTH-1:0] out_r_4[7:0];
    output [DATA_WIDTH-1:0] out_r_3[7:0];
        
    
   (* DONT_TOUCH = "YES" *)
    systolic_module systolic_structure(clk,input_left0,input_left1,input_left2,input_left3,input_left4,input_top0,input_top1,input_top2,input_top3,input_top4, out_b_5, out_b_4, out_b_3, out_r_4, out_r_3);
    
   (* DONT_TOUCH = "YES" *)
    transform_mat_to_conv CCU(clk,enable,is_compute_done,is_row_done,out_b_5,out_b_4,out_b_3,out_r_4,out_r_3,conv1,conv2,conv3);
    
    
endmodule
