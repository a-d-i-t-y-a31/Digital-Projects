`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 23:46:52
// Design Name: 
// Module Name: conv2d
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


module conv2d #(
    parameter IMG_WIDTH = 5
)(
    input clk,
    input rst,
    input [7:0] pixel_in,
    output valid,
    output signed [31:0] conv_out
);

    // Window buffer outputs (pixels)
    wire [7:0] w0, w1, w2,
               w3, w4, w5,
               w6, w7, w8;

    // Fixed weights
    wire signed [7:0] wt0, wt1, wt2,
                      wt3, wt4, wt5,
                      wt6, wt7, wt8;

    wire signed [31:0] mac_result;

    // Instantiate window buffer
    window_buffer #(.IMG_WIDTH(IMG_WIDTH)) wb (
        .clk(clk),
        .rst(rst),
        .pixel_in(pixel_in),
        .valid(valid),
        .w0(w0), .w1(w1), .w2(w2),
        .w3(w3), .w4(w4), .w5(w5),
        .w6(w6), .w7(w7), .w8(w8)
    );

    // Set weights (Sobel-X for example)
    assign wt0 =  1; assign wt1 =  0; assign wt2 = -1;
    assign wt3 =  1; assign wt4 =  0; assign wt5 = -1;
    assign wt6 =  1; assign wt7 =  0; assign wt8 = -1;

    // MAC unit
    mac mac_unit (
        .px0(w0), .px1(w1), .px2(w2),
        .px3(w3), .px4(w4), .px5(w5),
        .px6(w6), .px7(w7), .px8(w8),

        .wt0(wt0), .wt1(wt1), .wt2(wt2),
        .wt3(wt3), .wt4(wt4), .wt5(wt5),
        .wt6(wt6), .wt7(wt7), .wt8(wt8),

        .mac_out(mac_result)
    );

    assign conv_out = mac_result;
    always @(posedge clk)
    if (valid)
        $display("[conv2d] Valid output = %d", conv_out);

endmodule

