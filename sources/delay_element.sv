`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2022 19:50:13
// Design Name: 
// Module Name: delay_element
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


module delay_element #(parameter REG_WIDTH = 16) (clk,a_n_1,b_n_1,a_n,b_n);
    
    input clk;
    input [REG_WIDTH-1:0] a_n_1[7:0] ;
    input [REG_WIDTH-1:0] b_n_1[7:0] ;
    output reg [REG_WIDTH-1:0] a_n[7:0] ; //NEED NOT BE REG, JUST USED HERE TO SIMPLIFY
    output reg [REG_WIDTH-1:0] b_n[7:0] ; // POINT OF OPTIMISATION, CAN REMOVE REG
    
    always @(posedge clk) begin
        a_n <= a_n_1;
        b_n <= b_n_1;

    end
endmodule
