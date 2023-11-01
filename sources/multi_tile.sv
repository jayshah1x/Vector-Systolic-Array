`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2023 17:09:21
// Design Name: 
// Module Name: tile_structure
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

module multi_tile#(
       parameter DATA_WIDTH = 16,
                 COE_DATA_WIDTH = 9,
                 MATRIX_SIZE = 3,
                 N_TILES = 1
       
)(
    
    );
    
    wire clk;
    wire enable;    

    reg [13:0]pointer_image = 0;
    reg [1:0] pointer_kernel = 0;

    wire [DATA_WIDTH-1:0] array_input_top0 [7:0];
    wire [DATA_WIDTH-1:0] array_input_top1 [7:0];
    wire [DATA_WIDTH-1:0] array_input_top2 [7:0];
    wire [DATA_WIDTH-1:0] array_input_top3 [7:0];
    wire [DATA_WIDTH-1:0] array_input_top4 [7:0];

    wire [DATA_WIDTH-1:0] array_input_left0[7:0];
    
    wire [DATA_WIDTH-1:0] array_input_left1[7:0];
    wire [DATA_WIDTH-1:0] array_input_left2[7:0];
    wire [DATA_WIDTH-1:0] array_input_left3[7:0];
    wire [DATA_WIDTH-1:0] array_input_left4[7:0];

    wire is_compute_done,is_row_done;
    
    reg [DATA_WIDTH-1:0] conv1[7:0];
    reg [DATA_WIDTH-1:0] conv2[7:0];
    reg [DATA_WIDTH-1:0] conv3[7:0];

    wire [COE_DATA_WIDTH*MATRIX_SIZE:0] data_filter_blockram [7:0];
    wire [COE_DATA_WIDTH*MATRIX_SIZE:0] bank_out [7:0];
    
    //Debug purpose only
    wire [DATA_WIDTH-1:0] out_b_5[7:0];
    wire [DATA_WIDTH-1:0] out_b_4[7:0];
    wire [DATA_WIDTH-1:0] out_b_3[7:0];
    wire [DATA_WIDTH-1:0] out_r_4[7:0];
    wire [DATA_WIDTH-1:0] out_r_3[7:0];
    
    wire [1:0] debug_state;
    
    
    //Bram instantiation
    kernel_0 a_0 (
        .clka(clk),    // input wire clka
        .ena(enable),      // input wire ena
        .wea(0),      // input wire [0 : 0] wea
        .addra(pointer_kernel),  // input wire [1 : 0] addra
        .dina(0),    // input wire [44 : 0] dina
        .douta(data_filter_blockram[0])  // output wire [44 : 0] douta
        );
    

    
    //Banks for one Image Splitted into 8 parts for Vectored Processing

    bank_1 bnk_1 (
          .clka(clk),    // input wire clka
          .ena(enable),      // input wire ena
          .wea(0),      // input wire [0 : 0] wea
          .addra(pointer_image),  // input wire [13 : 0] addra
          .dina(0),    // input wire [27 : 0] dina
          .douta(bank_out[0])  // output wire [27 : 0] douta
    );  
    
   bank_2 bnk_2 (
      .clka(clk),    // input wire clka
      .ena(enable),      // input wire ena
      .wea(0),      // input wire [0 : 0] wea
      .addra(pointer_image),  // input wire [13 : 0] addra
      .dina(0),    // input wire [27 : 0] dina
      .douta(bank_out[1])  // output wire [27 : 0] douta
    );
    
    bank_3 bnk_3 (
          .clka(clk),    // input wire clka
          .ena(enable),      // input wire ena
          .wea(0),      // input wire [0 : 0] wea
          .addra(pointer_image),  // input wire [13 : 0] addra
          .dina(0),    // input wire [27 : 0] dina
          .douta(bank_out[2])  // output wire [27 : 0] douta
    );  
    
   bank_4 bnk_4 (
      .clka(clk),    // input wire clka
      .ena(enable),      // input wire ena
      .wea(0),      // input wire [0 : 0] wea
      .addra(pointer_image),  // input wire [13 : 0] addra
      .dina(0),    // input wire [27 : 0] dina
      .douta(bank_out[3])  // output wire [27 : 0] douta
    );
    
    bank_5 bnk_5 (
          .clka(clk),    // input wire clka
          .ena(enable),      // input wire ena
          .wea(0),      // input wire [0 : 0] wea
          .addra(pointer_image),  // input wire [13 : 0] addra
          .dina(0),    // input wire [27 : 0] dina
          .douta(bank_out[4])  // output wire [27 : 0] douta
    );  
    
   bank_6 bnk_6 (
      .clka(clk),    // input wire clka
      .ena(enable),      // input wire ena
      .wea(0),      // input wire [0 : 0] wea
      .addra(pointer_image),  // input wire [13 : 0] addra
      .dina(0),    // input wire [27 : 0] dina
      .douta(bank_out[5])  // output wire [27 : 0] douta
    );
    
    bank_7 bnk_7 (
          .clka(clk),    // input wire clka
          .ena(enable),      // input wire ena
          .wea(0),      // input wire [0 : 0] wea
          .addra(pointer_image),  // input wire [13 : 0] addra
          .dina(0),    // input wire [27 : 0] dina
          .douta(bank_out[6])  // output wire [27 : 0] douta
    );  
    
   bank_8 bnk_8 (
      .clka(clk),    // input wire clka
      .ena(enable),      // input wire ena
      .wea(0),      // input wire [0 : 0] wea
      .addra(pointer_image),  // input wire [13 : 0] addra
      .dina(0),    // input wire [27 : 0] dina
      .douta(bank_out[7])  // output wire [27 : 0] douta
);





    

    //Clock and Enable Signals applied here
    
    zynq_ultra_ps_e_0 ps_instance_name (
        .pl_clk0(clk)  // output wire pl_clk0
    );
    
    vio_0 vio_instance (
        .clk(clk),                // input wire clk
        .probe_out0(enable)  // output wire [0 : 0] probe_out0
    );
   
    
    (*DONT_TOUCH = "YES"*)
    //(*DONT_OPTIMISE = "YES"*)
    new_input_top image_bram_instance( .clk(clk), .enable(enable), .bram_in_1(bank_out[0]), .bram_in_2(bank_out[0]), .bram_in_3(bank_out[0]), .bram_in_4(bank_out[0]), .bram_in_5(bank_out[0]), .bram_in_6(bank_out[0]), .bram_in_7(bank_out[0]), .bram_in_8(bank_out[0]),
         .array_input_top0(array_input_top0), .array_input_top1(array_input_top1), .array_input_top2(array_input_top2), .array_input_top3(array_input_top3),
         .array_input_top4(array_input_top4)
          );

   (*DONT_TOUCH = "YES"*)
   input_left kernel_bram_instance( .clk(clk), .enable(enable), .data_filter_blockram(data_filter_blockram[0]),
        .array_input_left0(array_input_left0), .array_input_left1(array_input_left1), .array_input_left2(array_input_left2), .array_input_left3(array_input_left3),
        .array_input_left4(array_input_left4), .debug_state(debug_state)
        );

   
    
   (*DONT_TOUCH = "YES"*)
   tile tile_instance( .clk(clk), .enable(enable),
            .input_left0(array_input_left0), .input_left1(array_input_left1), .input_left2(array_input_left2), .input_left3(array_input_left3), .input_left4(array_input_left4),
            .input_top0(array_input_top0), .input_top1(array_input_top1), .input_top2(array_input_top2), .input_top3(array_input_top3), .input_top4(array_input_top4),
            .out_b_5(out_b_5) , .out_b_4(out_b_4), .out_b_3(out_b_3), .out_r_4(out_r_4), .out_r_3(out_r_3),
            .is_compute_done(enable), .is_row_done(enable), .conv1(conv1), .conv2(conv2), .conv3(conv3)
            );    
    
          
   always @(posedge clk) begin
      if(enable) begin
           if(pointer_kernel == 2'd3)begin
                    pointer_kernel = 1;
                end
                else begin
                    pointer_kernel = pointer_kernel + 1;
                end
            end
          end
          
          always @(posedge clk) begin
            if(enable) begin
                if(pointer_image == 'd15)begin
                    pointer_image = 1;
                end
                else begin
                    pointer_image = pointer_image + 1;
                end
            end
          end
          
          
          
        /*  ila_0 ila_instance (
            .clk(clk), // input wire clk
        
        
            .probe0(array_input_left0[0][0]), // input wire [15:0]  probe0  
            .probe1(array_input_left1[0][0]), // input wire [15:0]  probe1 
            .probe2(array_input_left2[0][0]), // input wire [15:0]  probe2 
            .probe3(array_input_left3[0][0]), // input wire [15:0]  probe3 
            .probe4(array_input_left4[0][0]), // input wire [15:0]  probe4 
            .probe5(array_input_top0[0]), // input wire [15:0]  probe5 
            .probe6(array_input_top1[0]), // input wire [15:0]  probe6 
            .probe7(array_input_top2[0]), // input wire [15:0]  probe7 
            .probe8(array_input_top3[0]), // input wire [15:0]  probe8 
            .probe9(array_input_top4[0]), // input wire [15:0]  probe9 
            .probe10(out_b_5[0]), // input wire [15:0]  probe10 
            .probe11(out_b_4[0]), // input wire [15:0]  probe11 
            .probe12(out_b_3[0]), // input wire [15:0]  probe12 
            .probe13(out_r_4[0]), // input wire [15:0]  probe13 
            .probe14(out_r_3[0]), // input wire [15:0]  probe14 
            .probe15(conv1[0][0]), // input wire [15:0]  probe15 
            .probe16(conv2[0][0]), // input wire [15:0]  probe16 
            .probe17(conv3[0][0]), // input wire [15:0]  probe17 
            .probe18(pointer_kernel), // input wire [2:0]  probe18 
            .probe19(pointer_image), // input wire [13:0]  probe19 
            .probe20(enable), // input wire [0:0]  probe20 // input wire [15:0]  probe17
            .probe21(data_filter_blockram[0]),
            .probe22(debug_state)
                );*/
      

    
endmodule
