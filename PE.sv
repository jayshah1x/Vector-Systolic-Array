`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2022 19:50:13
// Design Name: 
// Module Name: PE
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

//`ifdef USE_DSP
//    (* use_dsp = "yes" *)
//`else 
//    (* use_dsp = "no" *)
//`endif

//`ifdef DONT_USE_DSP
//    (* use_dsp = "no" *)
//`endif
    

module PE #(parameter REG_WIDTH = 16) (clk,a_n_1,b_n_1,c_n_1,a_n,b_n,c_ab);
    
    input clk;
    input [REG_WIDTH-1:0] a_n_1[7:0] ;
    input [REG_WIDTH-1:0] b_n_1[7:0] ;
    input [REG_WIDTH-1:0] c_n_1[7:0] ;
    output reg [REG_WIDTH-1:0] a_n[7:0]; //NEED NOT BE REG, JUST USED HERE TO SIMPLIFY
    output reg [REG_WIDTH-1:0] b_n[7:0]; // POINT OF OPTIMISATION, CAN REMOVE REG
    output reg [REG_WIDTH-1:0] c_ab[7:0];
    
    always @(posedge clk) begin
        a_n <= a_n_1;
        b_n <= b_n_1;
        c_ab[0] <= a_n_1[0] * b_n_1[0] + c_n_1[0];
        c_ab[1] <= a_n_1[1] * b_n_1[1] + c_n_1[1];
        c_ab[2] <= a_n_1[2] * b_n_1[2] + c_n_1[2];
        c_ab[3] <= a_n_1[3] * b_n_1[3] + c_n_1[3];
        c_ab[4] <= a_n_1[4] * b_n_1[4] + c_n_1[4];
        c_ab[5] <= a_n_1[5] * b_n_1[5] + c_n_1[5];
        c_ab[6] <= a_n_1[6] * b_n_1[6] + c_n_1[6];
        c_ab[7] <= a_n_1[7] * b_n_1[7] + c_n_1[7];
        
//        $timeformat(-12, 3, " ns");
//        $display("[T=%0t]", $realtime);
//        $display("a:%b\n",a_n_1[0]); 
//        $display("b:%b\n",b_n_1[0]);
//        $display("c:%b\n",c_n_1[0]); 
//        $display("res:%b\n",c_ab[0]); 
//        $display("\n##################\n");
    end
endmodule
