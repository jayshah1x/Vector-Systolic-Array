`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 09.03.2022 20:15:45
// Design Name:
// Module Name: mat_to_conv
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

(*use_dsp = "no"*)
module transform_mat_to_conv(clk,enable,is_compute_done,is_row_done,c_b_5,c_b_4,c_b_3,c_r_4,c_r_3,c1,c2,c3);
    parameter DATA_WIDTH = 16;
    input clk;
    input is_compute_done; // has two functions, mem overhead and buffering
    input is_row_done;
    input enable;
    input [DATA_WIDTH-1:0] c_b_5[7:0];
    input [DATA_WIDTH-1:0] c_b_4[7:0];
    input [DATA_WIDTH-1:0] c_b_3[7:0];
    input [DATA_WIDTH-1:0] c_r_4[7:0];
    input [DATA_WIDTH-1:0] c_r_3[7:0];
    output reg [DATA_WIDTH-1:0] c1[7:0];
    output reg [DATA_WIDTH-1:0] c2[7:0];
    output reg [DATA_WIDTH-1:0] c3[7:0];
   
    reg [DATA_WIDTH-1:0] acc_b5[7:0];
    reg [DATA_WIDTH-1:0] acc_b4[7:0];
    reg [DATA_WIDTH-1:0] acc_b3[7:0];
    reg [DATA_WIDTH-1:0] acc_r4[7:0];
    reg [DATA_WIDTH-1:0] acc_r3[7:0];
    reg [DATA_WIDTH-1:0] previous_acc_r4[7:0];
    reg [DATA_WIDTH-1:0] previous_acc_r3[7:0];
    initial begin
        acc_b5[0] = 0;acc_b5[1] = 0;acc_b5[2] = 0;acc_b5[3] = 0;acc_b5[4] = 0;acc_b5[5] = 0;acc_b5[6] = 0;acc_b5[7] = 0;
        acc_b4[0] = 0;acc_b4[1] = 0;acc_b4[2] = 0;acc_b4[3] = 0;acc_b4[4] = 0;acc_b4[5] = 0;acc_b4[6] = 0;acc_b4[7] = 0;
        acc_b3[0] = 0;acc_b3[1] = 0;acc_b3[2] = 0;acc_b3[3] = 0;acc_b3[4] = 0;acc_b3[5] = 0;acc_b3[6] = 0;acc_b3[7] = 0;
        acc_r4[0] = 0;acc_r4[1] = 0;acc_r4[2] = 0;acc_r4[3] = 0;acc_r4[4] = 0;acc_r4[5] = 0;acc_r4[6] = 0;acc_r4[7] = 0;
        acc_r3[0] = 0;acc_r3[1] = 0;acc_r3[2] = 0;acc_r3[3] = 0;acc_r3[4] = 0;acc_r3[5] = 0;acc_r3[6] = 0;acc_r3[7] = 0;
//        acc_r4 = 0;
//        acc_r3=0;
//        previous_acc_r4=0;
//        previous_acc_r3=0;
        previous_acc_r4[0] = 0;previous_acc_r4[1] = 0;previous_acc_r4[2] = 0;previous_acc_r4[3] = 0;previous_acc_r4[4] = 0;previous_acc_r4[5] = 0;previous_acc_r4[6] = 0;previous_acc_r4[7] = 0;
        previous_acc_r3[0] = 0;previous_acc_r3[1] = 0;previous_acc_r3[2] = 0;previous_acc_r3[3] = 0;previous_acc_r3[4] = 0;previous_acc_r3[5] = 0;previous_acc_r3[6] = 0;previous_acc_r3[7] = 0;
        c1[0] = 0;c1[1] = 0;c1[2] = 0;c1[3] = 0;c1[4] = 0;c1[5] = 0;c1[6] = 0;c1[7] = 0;
        c2[0] = 0;c2[1] = 0;c2[2] = 0;c2[3] = 0;c2[4] = 0;c2[5] = 0;c2[6] = 0;c2[7] = 0;
        c3[0] = 0;c3[1] = 0;c3[2] = 0;c3[3] = 0;c3[4] = 0;c3[5] = 0;c3[6] = 0;c3[7] = 0;
    end
   
   
    reg [1:0] count = 1;
   
   
    always @(posedge clk) begin
        if(is_compute_done & enable) begin
            if(count == 2'd2) begin
                count <= 0;
            end
            else begin
                count <= count + 1;      
            end
           
            if(count != 1) begin
                acc_b5[0] <= acc_b5[0] + c_b_5[0];
                acc_b4[0] <= acc_b4[0] + c_b_4[0];
                acc_b3[0] <= acc_b3[0] + c_b_3[0];
                acc_r4[0] <= acc_r4[0] + c_r_4[0];
                acc_r3[0] <= acc_r3[0] + c_r_3[0];

               
                acc_b5[1] <= acc_b5[1] + c_b_5[1];
                acc_b4[1] <= acc_b4[1] + c_b_4[1];
                acc_b3[1] <= acc_b3[1] + c_b_3[1];
                acc_r4[1] <= acc_r4[1] + c_r_4[1];
                acc_r3[1] <= acc_r3[1] + c_r_3[1];

               
                acc_b5[2] <= acc_b5[2] + c_b_5[2];
                acc_b4[2] <= acc_b4[2] + c_b_4[2];
                acc_b3[2] <= acc_b3[2] + c_b_3[2];
                acc_r4[2] <= acc_r4[2] + c_r_4[2];
                acc_r3[2] <= acc_r3[2] + c_r_3[2];
               
                acc_b5[3] <= acc_b5[3] + c_b_5[3];
                acc_b4[3] <= acc_b4[3] + c_b_4[3];
                acc_b3[3] <= acc_b3[3] + c_b_3[3];
                acc_r4[3] <= acc_r4[3] + c_r_4[3];
                acc_r3[3] <= acc_r3[3] + c_r_3[3];
               
                acc_b5[4] <= acc_b5[4] + c_b_5[4];
                acc_b4[4] <= acc_b4[4] + c_b_4[4];
                acc_b3[4] <= acc_b3[4] + c_b_3[4];
                acc_r4[4] <= acc_r4[4] + c_r_4[4];
                acc_r3[4] <= acc_r3[4] + c_r_3[4];
               
                acc_b5[5] <= acc_b5[5] + c_b_5[5];
                acc_b4[5] <= acc_b4[5] + c_b_4[5];
                acc_b3[5] <= acc_b3[5] + c_b_3[5];
                acc_r4[5] <= acc_r4[5] + c_r_4[5];
                acc_r3[5] <= acc_r3[5] + c_r_3[5];
               
                acc_b5[6] <= acc_b5[6] + c_b_5[6];
                acc_b4[6] <= acc_b4[6] + c_b_4[6];
                acc_b3[6] <= acc_b3[6] + c_b_3[6];
                acc_r4[6] <= acc_r4[6] + c_r_4[6];
                acc_r3[6] <= acc_r3[6] + c_r_3[6];
               
                acc_b5[7] <= acc_b5[7] + c_b_5[7];
                acc_b4[7] <= acc_b4[7] + c_b_4[7];
                acc_b3[7] <= acc_b3[7] + c_b_3[7];
                acc_r4[7] <= acc_r4[7] + c_r_4[7];
                acc_r3[7] <= acc_r3[7] + c_r_3[7];
               
            end
            else if(count == 1) begin
               
                c1[0] <= acc_b5[0];
                c2[0] <= acc_b4[0] + previous_acc_r3[7];
                c3[0] <= acc_b3[0] + previous_acc_r4[7];            
                previous_acc_r3[0] <= acc_r3[0];
                previous_acc_r4[0] <= acc_r4[0];
               
                c1[1] <= acc_b5[1];
                c2[1] <= acc_b4[1] + acc_r3[0];
                c3[1] <= acc_b3[1] + acc_r4[0];
                previous_acc_r3[1] <= acc_r3[1];
                previous_acc_r4[1] <= acc_r4[1];
               
                c1[2] <= acc_b5[2];
                c2[2] <= acc_b4[2] + acc_r3[1];
                c3[2] <= acc_b3[2] + acc_r4[1];
                previous_acc_r3[2] <= acc_r3[2];
                previous_acc_r4[2] <= acc_r4[2];
               
                c1[3] <= acc_b5[3];
                c2[3] <= acc_b4[3] + acc_r3[2];
                c3[3] <= acc_b3[3] + acc_r4[2];
                previous_acc_r3[3] <= acc_r3[3];
                previous_acc_r4[3] <= acc_r4[3];
               
                c1[4] <= acc_b5[4];
                c2[4] <= acc_b4[4] + acc_r3[3];
                c3[4] <= acc_b3[4] + acc_r4[3];
                previous_acc_r3[4] <= acc_r3[4];
                previous_acc_r4[4] <= acc_r4[4];
               
                c1[5] <= acc_b5[5];
                c2[5] <= acc_b4[5] + acc_r3[4];
                c3[5] <= acc_b3[5] + acc_r4[4];
                previous_acc_r3[5] <= acc_r3[5];
                previous_acc_r4[5] <= acc_r4[5];
               
                c1[6] <= acc_b5[6];
                c2[6] <= acc_b4[6] + acc_r3[5];
                c3[6] <= acc_b3[6] + acc_r4[5];
                previous_acc_r3[6] <= acc_r3[6];
                previous_acc_r4[6] <= acc_r4[6];
               
                c1[7] <= acc_b5[7];
                c2[7] <= acc_b4[7] + acc_r3[6];
                c3[7] <= acc_b3[7] + acc_r4[6];
                previous_acc_r3[7] <= acc_r3[7];
                previous_acc_r4[7] <= acc_r4[7];
               
               
               
                acc_b5 <= c_b_5;
                acc_b4 <= c_b_4;
                acc_b3 <= c_b_3;
                acc_r4 <= c_r_4;
                acc_r3 <= c_r_3;
            end
        end        
    end
   
   
endmodule
