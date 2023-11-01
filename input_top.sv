module new_input_top(clk,enable,bram_in_1, bram_in_2, bram_in_3, bram_in_4, bram_in_5, bram_in_6, bram_in_7, bram_in_8,array_input_top0,array_input_top1,array_input_top2,array_input_top3,array_input_top4);
   
    parameter DATA_WIDTH =16;
    parameter COE_DATA_WIDTH = 9;
    parameter MATRIX_SIZE = 3;

//    (*use_dsp = "no"*)

    input clk;
    input enable;
    input [COE_DATA_WIDTH*MATRIX_SIZE:0] bram_in_1;
    input [COE_DATA_WIDTH*MATRIX_SIZE:0] bram_in_2;
    input [COE_DATA_WIDTH*MATRIX_SIZE:0] bram_in_3;
    input [COE_DATA_WIDTH*MATRIX_SIZE:0] bram_in_4;
    input [COE_DATA_WIDTH*MATRIX_SIZE:0] bram_in_5;
    input [COE_DATA_WIDTH*MATRIX_SIZE:0] bram_in_6;
    input [COE_DATA_WIDTH*MATRIX_SIZE:0] bram_in_7;
    input [COE_DATA_WIDTH*MATRIX_SIZE:0] bram_in_8;
    //input [COE_DATA_WIDTH*MATRIX_SIZE:0] bank_out  [7:0];
    output reg [DATA_WIDTH-1:0] array_input_top0 [7:0];
    output reg [DATA_WIDTH-1:0] array_input_top1 [7:0];
    output reg [DATA_WIDTH-1:0] array_input_top2 [7:0];
    output reg [DATA_WIDTH-1:0] array_input_top3 [7:0];
    output reg [DATA_WIDTH-1:0] array_input_top4 [7:0];
   
   
    //wire [COE_DATA_WIDTH*MATRIX_SIZE:0] bram_out;
    wire [COE_DATA_WIDTH*MATRIX_SIZE:0] bank_out [7:0];
   
//    wire [COE_DATA_WIDTH*MATRIX_SIZE:0] bank_out_1 [1:0];
//    wire [COE_DATA_WIDTH*MATRIX_SIZE:0] bank_out_2;
//    wire [COE_DATA_WIDTH*MATRIX_SIZE:0] bank_out_3;
//    wire [COE_DATA_WIDTH*MATRIX_SIZE:0] bank_out_4;
//    wire [COE_DATA_WIDTH*MATRIX_SIZE:0] bank_out_5;
//    wire [COE_DATA_WIDTH*MATRIX_SIZE:0] bank_out_6;
//    wire [COE_DATA_WIDTH*MATRIX_SIZE:0] bank_out_7;
//    wire [COE_DATA_WIDTH*MATRIX_SIZE:0] bank_out_8;
    reg [1:0] count = 1;
    wire is_data_valid [7:0];
//    wire is_data_valid_2;
//    wire is_data_valid_3;
//    wire is_data_valid_4;
//    wire is_data_valid_5;
//    wire is_data_valid_6;
//    wire is_data_valid_7;
//    wire is_data_valid_8;
   
//    blk_mem_gen_1 b_0 (
//        .clka(clk),    // input wire clka
//        .ena(enable),      // input wire ena
//        .wea(0),      // input wire [0 : 0] wea
//        .addra(address),  // input wire [9 : 0] addra
//        .dina(0),    // input wire [7 : 0] dina
//        .douta(bram_out)  // output wire [7 : 0] doutaarray_input_top2
//    );
   
//    assign is_data_valid_1 = bank_out_1[COE_DATA_WIDTH*MATRIX_SIZE];  
//    assign is_data_valid_2 = bank_out_2[COE_DATA_WIDTH*MATRIX_SIZE];
//    assign is_data_valid_3 = bank_out_3[COE_DATA_WIDTH*MATRIX_SIZE];
//    assign is_data_valid_4 = bank_out_4[COE_DATA_WIDTH*MATRIX_SIZE];
//    assign is_data_valid_5 = bank_out_5[COE_DATA_WIDTH*MATRIX_SIZE];
//    assign is_data_valid_6 = bank_out_6[COE_DATA_WIDTH*MATRIX_SIZE];
//    assign is_data_valid_7 = bank_out_7[COE_DATA_WIDTH*MATRIX_SIZE];
//    assign is_data_valid_8 = bank_out_8[COE_DATA_WIDTH*MATRIX_SIZE];

assign bank_out[0] = bram_in_1;
assign bank_out[1] = bram_in_2;
assign bank_out[2] = bram_in_3;
assign bank_out[3] = bram_in_4;
assign bank_out[4] = bram_in_5;
assign bank_out[5] = bram_in_6;
assign bank_out[6] = bram_in_7;
assign bank_out[7] = bram_in_8;

assign is_data_valid[0] = bank_out[0][COE_DATA_WIDTH*MATRIX_SIZE];
assign is_data_valid[1] = bank_out[1][COE_DATA_WIDTH*MATRIX_SIZE];
assign is_data_valid[2] = bank_out[2][COE_DATA_WIDTH*MATRIX_SIZE];
assign is_data_valid[3] = bank_out[3][COE_DATA_WIDTH*MATRIX_SIZE];
assign is_data_valid[4] = bank_out[4][COE_DATA_WIDTH*MATRIX_SIZE];
assign is_data_valid[5] = bank_out[5][COE_DATA_WIDTH*MATRIX_SIZE];
assign is_data_valid[6] = bank_out[6][COE_DATA_WIDTH*MATRIX_SIZE];
assign is_data_valid[7] = bank_out[7][COE_DATA_WIDTH*MATRIX_SIZE];

   

    always @(posedge clk) begin
        if(enable) begin
       
            case(count)

                2'd1: begin
                array_input_top0[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[0][COE_DATA_WIDTH-1]}} ,bank_out[0][COE_DATA_WIDTH-1:0]};
                array_input_top1[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[0][2*COE_DATA_WIDTH-1]}} ,bank_out[0][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top2[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[0][3*COE_DATA_WIDTH-1]}} ,bank_out[0][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_top3[0] <= 8'd0;
                array_input_top4[0] <= 8'd0;
               
               
                array_input_top0[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[1][COE_DATA_WIDTH-1]}} ,bank_out[1][COE_DATA_WIDTH-1:0]};
                array_input_top1[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[1][2*COE_DATA_WIDTH-1]}} ,bank_out[1][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top2[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[1][3*COE_DATA_WIDTH-1]}} ,bank_out[1][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_top3[1] <= 8'd0;
                array_input_top4[1] <= 8'd0;
               
                array_input_top0[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[2][COE_DATA_WIDTH-1]}} ,bank_out[2][COE_DATA_WIDTH-1:0]};
                array_input_top1[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[2][2*COE_DATA_WIDTH-1]}} ,bank_out[2][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top2[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[2][3*COE_DATA_WIDTH-1]}} ,bank_out[2][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_top3[2] <= 8'd0;
                array_input_top4[2] <= 8'd0;
               
               
                array_input_top0[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[3][COE_DATA_WIDTH-1]}} ,bank_out[3][COE_DATA_WIDTH-1:0]};
                array_input_top1[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[3][2*COE_DATA_WIDTH-1]}} ,bank_out[3][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top2[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[3][3*COE_DATA_WIDTH-1]}} ,bank_out[3][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_top3[3] <= 8'd0;
                array_input_top4[3] <= 8'd0;
               
                array_input_top0[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[4][COE_DATA_WIDTH-1]}} ,bank_out[4][COE_DATA_WIDTH-1:0]};
                array_input_top1[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[4][2*COE_DATA_WIDTH-1]}} ,bank_out[4][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top2[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[4][3*COE_DATA_WIDTH-1]}} ,bank_out[4][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_top3[4] <= 8'd0;
                array_input_top4[4] <= 8'd0;
               
               
                array_input_top0[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[5][COE_DATA_WIDTH-1]}} ,bank_out[5][COE_DATA_WIDTH-1:0]};
                array_input_top1[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[5][2*COE_DATA_WIDTH-1]}} ,bank_out[5][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top2[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[5][3*COE_DATA_WIDTH-1]}} ,bank_out[5][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_top3[5] <= 8'd0;
                array_input_top4[5] <= 8'd0;
               
                array_input_top0[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[6][COE_DATA_WIDTH-1]}} ,bank_out[6][COE_DATA_WIDTH-1:0]};
                array_input_top1[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[6][2*COE_DATA_WIDTH-1]}} ,bank_out[6][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top2[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[6][3*COE_DATA_WIDTH-1]}} ,bank_out[6][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_top3[6] <= 8'd0;
                array_input_top4[6] <= 8'd0;
               
               
                array_input_top0[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[7][COE_DATA_WIDTH-1]}} ,bank_out[7][COE_DATA_WIDTH-1:0]};
                array_input_top1[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[7][2*COE_DATA_WIDTH-1]}} ,bank_out[7][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top2[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[7][3*COE_DATA_WIDTH-1]}} ,bank_out[7][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_top3[7] <= 8'd0;
                array_input_top4[7] <= 8'd0;
               
               
            end
            2'd2: begin
                array_input_top0[0] <= 8'd0;
                array_input_top1[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[0][COE_DATA_WIDTH-1]}} ,bank_out[0][COE_DATA_WIDTH-1:0]};
                array_input_top2[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[0][2*COE_DATA_WIDTH-1]}} ,bank_out[0][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top3[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[0][3*COE_DATA_WIDTH-1]}} ,bank_out[0][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_top4[0] <= 8'd0;
               
               
                array_input_top0[1] <= 8'd0;
                array_input_top1[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[1][COE_DATA_WIDTH-1]}} ,bank_out[1][COE_DATA_WIDTH-1:0]};
                array_input_top2[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[1][2*COE_DATA_WIDTH-1]}} ,bank_out[1][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top3[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[1][3*COE_DATA_WIDTH-1]}} ,bank_out[1][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_top4[1] <= 8'd0;
               
                array_input_top0[2] <= 8'd0;
                array_input_top1[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[2][COE_DATA_WIDTH-1]}} ,bank_out[2][COE_DATA_WIDTH-1:0]};
                array_input_top2[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[2][2*COE_DATA_WIDTH-1]}} ,bank_out[2][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top3[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[2][3*COE_DATA_WIDTH-1]}} ,bank_out[2][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_top4[2] <= 8'd0;
               
               
                array_input_top0[3] <= 8'd0;
                array_input_top1[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[3][COE_DATA_WIDTH-1]}} ,bank_out[3][COE_DATA_WIDTH-1:0]};
                array_input_top2[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[3][2*COE_DATA_WIDTH-1]}} ,bank_out[3][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top3[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[3][3*COE_DATA_WIDTH-1]}} ,bank_out[3][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_top4[3] <= 8'd0;
               
                array_input_top0[4] <= 8'd0;
                array_input_top1[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[4][COE_DATA_WIDTH-1]}} ,bank_out[4][COE_DATA_WIDTH-1:0]};
                array_input_top2[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[4][2*COE_DATA_WIDTH-1]}} ,bank_out[4][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top3[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[4][3*COE_DATA_WIDTH-1]}} ,bank_out[4][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_top4[4] <= 8'd0;
               
               
                array_input_top0[5] <= 8'd0;
                array_input_top1[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[5][COE_DATA_WIDTH-1]}} ,bank_out[5][COE_DATA_WIDTH-1:0]};
                array_input_top2[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[5][2*COE_DATA_WIDTH-1]}} ,bank_out[5][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top3[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[5][3*COE_DATA_WIDTH-1]}} ,bank_out[5][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_top4[5] <= 8'd0;
               
                array_input_top0[6] <= 8'd0;
                array_input_top1[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[6][COE_DATA_WIDTH-1]}} ,bank_out[6][COE_DATA_WIDTH-1:0]};
                array_input_top2[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[6][2*COE_DATA_WIDTH-1]}} ,bank_out[6][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top3[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[6][3*COE_DATA_WIDTH-1]}} ,bank_out[6][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_top4[6] <= 8'd0;
               
               
                array_input_top0[7] <= 8'd0;
                array_input_top1[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[7][COE_DATA_WIDTH-1]}} ,bank_out[7][COE_DATA_WIDTH-1:0]};
                array_input_top2[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[7][2*COE_DATA_WIDTH-1]}} ,bank_out[7][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top3[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[7][3*COE_DATA_WIDTH-1]}} ,bank_out[7][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
                array_input_top4[7] <= 8'd0;
               

            end
            2'd3: begin
                array_input_top0[0] <= 8'd0;
                array_input_top1[0] <= 8'd0;
                array_input_top2[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[0][COE_DATA_WIDTH-1]}} ,bank_out[0][COE_DATA_WIDTH-1:0]};
                array_input_top3[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[0][2*COE_DATA_WIDTH-1]}} ,bank_out[0][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top4[0] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[0][3*COE_DATA_WIDTH-1]}} ,bank_out[0][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
               
               
                array_input_top0[1] <= 8'd0;
                array_input_top1[1] <= 8'd0;
                array_input_top2[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[1][COE_DATA_WIDTH-1]}} ,bank_out[1][COE_DATA_WIDTH-1:0]};
                array_input_top3[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[1][2*COE_DATA_WIDTH-1]}} ,bank_out[1][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top4[1] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[1][3*COE_DATA_WIDTH-1]}} ,bank_out[1][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
               
                array_input_top0[2] <= 8'd0;
                array_input_top1[2] <= 8'd0;
                array_input_top2[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[2][COE_DATA_WIDTH-1]}} ,bank_out[2][COE_DATA_WIDTH-1:0]};
                array_input_top3[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[2][2*COE_DATA_WIDTH-1]}} ,bank_out[2][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top4[2] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[2][3*COE_DATA_WIDTH-1]}} ,bank_out[2][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
               
               
                array_input_top0[3] <= 8'd0;
                array_input_top1[3] <= 8'd0;
                array_input_top2[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[3][COE_DATA_WIDTH-1]}} ,bank_out[3][COE_DATA_WIDTH-1:0]};
                array_input_top3[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[3][2*COE_DATA_WIDTH-1]}} ,bank_out[3][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top4[3] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[3][3*COE_DATA_WIDTH-1]}} ,bank_out[3][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
               
                array_input_top0[4] <= 8'd0;
                array_input_top1[4] <= 8'd0;
                array_input_top2[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[4][COE_DATA_WIDTH-1]}} ,bank_out[4][COE_DATA_WIDTH-1:0]};
                array_input_top3[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[4][2*COE_DATA_WIDTH-1]}} ,bank_out[4][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top4[4] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[4][3*COE_DATA_WIDTH-1]}} ,bank_out[4][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
               
               
                array_input_top0[5] <= 8'd0;
                array_input_top1[5] <= 8'd0;
                array_input_top2[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[5][COE_DATA_WIDTH-1]}} ,bank_out[5][COE_DATA_WIDTH-1:0]};
                array_input_top3[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[5][2*COE_DATA_WIDTH-1]}} ,bank_out[5][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top4[5] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[5][3*COE_DATA_WIDTH-1]}} ,bank_out[5][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
               
                array_input_top0[6] <= 8'd0;
                array_input_top1[6] <= 8'd0;
                array_input_top2[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[6][COE_DATA_WIDTH-1]}} ,bank_out[6][COE_DATA_WIDTH-1:0]};
                array_input_top3[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[6][2*COE_DATA_WIDTH-1]}} ,bank_out[6][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top4[6] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[6][3*COE_DATA_WIDTH-1]}} ,bank_out[6][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
               
               
                array_input_top0[7] <= 8'd0;
                array_input_top1[7] <= 8'd0;
                array_input_top2[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[7][COE_DATA_WIDTH-1]}} ,bank_out[7][COE_DATA_WIDTH-1:0]};
                array_input_top3[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[7][2*COE_DATA_WIDTH-1]}} ,bank_out[7][2*COE_DATA_WIDTH - 1:COE_DATA_WIDTH]};
                array_input_top4[7] <= { {(DATA_WIDTH-COE_DATA_WIDTH){bank_out[7][3*COE_DATA_WIDTH-1]}} ,bank_out[7][3*COE_DATA_WIDTH-1:2*COE_DATA_WIDTH]};
               

                end
            endcase

            if(is_data_valid[0]&&is_data_valid[1]&&is_data_valid[2]&&is_data_valid[3]&&is_data_valid[4]&&is_data_valid[5]&&is_data_valid[6]&&is_data_valid[7]) begin
                if(count == 2'd3 ) begin
                    count <= 2'd1;
                end
                else begin
                    count <= count + 1;
                end
            end
        end
    end
   
endmodule