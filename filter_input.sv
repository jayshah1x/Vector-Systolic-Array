`timescale 1ns / 1ps


module input_left(clk,enable,data_filter_blockram,array_input_left0,array_input_left1,array_input_left2,array_input_left3,array_input_left4, debug_state);

    parameter DATA_WIDTH = 16;
    parameter COE_DATA_WIDTH = 9;
    parameter MATRIX_SIZE = 3;

    input clk;
    input enable;
    input [COE_DATA_WIDTH*MATRIX_SIZE:0] data_filter_blockram;
    output reg [DATA_WIDTH-1:0] array_input_left0[7:0];
    output reg [DATA_WIDTH-1:0] array_input_left1[7:0];
    output reg [DATA_WIDTH-1:0] array_input_left2[7:0];
    output reg [DATA_WIDTH-1:0] array_input_left3[7:0];
    output reg [DATA_WIDTH-1:0] array_input_left4[7:0];
    output reg [1:0] debug_state;


    //wire [COE_DATA_WIDTH*MATRIX_SIZE:0] data_filter_blockram;
   reg [1:0] count = 0;
//    blk_mem_gen_0 a_0 (
//        .clka(clk),    
//        .ena(enable),    
//        .wea(0),      
//        .addra(address),  
//        .dina(0),    
//        .douta(data_filter_blockram)
//    );
   
   
    

    always @(posedge clk) begin
        if(enable) begin
            if(count == 2'd3) begin
                count <= 2'd1;
            end
            else begin
                count <= count + 1;
            end
        end
    end 
    
    always @(posedge clk) begin
        if(enable) begin
            case(count)

                2'd1: begin
                debug_state = 2'b01;
                array_input_left0[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left1[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left2[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_left3[0] <= 8'd0;
                array_input_left4[0] <= 8'd0;
               
               
                array_input_left0[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left1[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left2[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_left3[1] <= 8'd0;
                array_input_left4[1] <= 8'd0;
               
                array_input_left0[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left1[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left2[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_left3[2] <= 8'd0;
                array_input_left4[2] <= 8'd0;
               
               
                array_input_left0[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left1[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left2[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_left3[3] <= 8'd0;
                array_input_left4[3] <= 8'd0;
               
                array_input_left0[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left1[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left2[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_left3[4] <= 8'd0;
                array_input_left4[4] <= 8'd0;
               
               
                array_input_left0[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left1[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left2[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_left3[5] <= 8'd0;
                array_input_left4[5] <= 8'd0;
               
                array_input_left0[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left1[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left2[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_left3[6] <= 8'd0;
                array_input_left4[6] <= 8'd0;
               
               
                array_input_left0[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left1[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left2[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_left3[7] <= 8'd0;
                array_input_left4[7] <= 8'd0;
               
               
            end
            2'd2: begin
                debug_state = 2'b10;
                array_input_left0[0] <= 8'd0;
                array_input_left1[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left2[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left3[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_left4[0] <= 8'd0;
               
               
                array_input_left0[1] <= 8'd0;
                array_input_left1[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left2[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left3[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_left4[1] <= 8'd0;
               
                array_input_left0[2] <= 8'd0;
                array_input_left1[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left2[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left3[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_left4[2] <= 8'd0;
               
               
                array_input_left0[3] <= 8'd0;
                array_input_left1[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left2[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left3[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_left4[3] <= 8'd0;
               
                array_input_left0[4] <= 8'd0;
                array_input_left1[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left2[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left3[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_left4[4] <= 8'd0;
               
               
                array_input_left0[5] <= 8'd0;
                array_input_left1[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left2[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left3[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_left4[5] <= 8'd0;
               
                array_input_left0[6] <= 8'd0;
                array_input_left1[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left2[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left3[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_left4[6] <= 8'd0;
               
               
                array_input_left0[7] <= 8'd0;
                array_input_left1[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left2[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left3[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_left4[7] <= 8'd0;
               

            end
            2'd3: begin
                debug_state = 2'b11;
                array_input_left0[0] <= 8'd0;
                array_input_left1[0] <= 8'd0;
                array_input_left2[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left3[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left4[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
               
               
                array_input_left0[1] <= 8'd0;
                array_input_left1[1] <= 8'd0;
                array_input_left2[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left3[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left4[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
               
                array_input_left0[2] <= 8'd0;
                array_input_left1[2] <= 8'd0;
                array_input_left2[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left3[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left4[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
               
               
                array_input_left0[3] <= 8'd0;
                array_input_left1[3] <= 8'd0;
                array_input_left2[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left3[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left4[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
               
                array_input_left0[4] <= 8'd0;
                array_input_left1[4] <= 8'd0;
                array_input_left2[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left3[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left4[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
               
               
                array_input_left0[5] <= 8'd0;
                array_input_left1[5] <= 8'd0;
                array_input_left2[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left3[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left4[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
               
                array_input_left0[6] <= 8'd0;
                array_input_left1[6] <= 8'd0;
                array_input_left2[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left3[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left4[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
               
               
                array_input_left0[7] <= 8'd0;
                array_input_left1[7] <= 8'd0;
                array_input_left2[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[COE_DATA_WIDTH-1]}} ,data_filter_blockram[COE_DATA_WIDTH-1:0]};
                array_input_left3[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[2*COE_DATA_WIDTH-1]}} ,data_filter_blockram[2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_left4[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){data_filter_blockram[3*COE_DATA_WIDTH-1]}} ,data_filter_blockram[3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
               

                end
            endcase

        end
   
    end
   
   
   
   

endmodule