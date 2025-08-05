`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2025 21:05:23
// Design Name: 
// Module Name: conv_top
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


module conv_top (
    input clk,
    input rst
);

    wire [7:0] pixel;
    wire signed [31:0] conv_out;
    wire valid;
    wire done;

    conv2d dut_conv (
        .clk(clk),
        .rst(rst),
        .pixel_in(pixel),
        .conv_out(conv_out),
        .valid(valid)
    );

    conv_ctrl dut_ctrl (
        .clk(clk),
        .rst(rst),
        .pixel_out(pixel),
        .conv_out(conv_out),
        .valid(valid),
        .done(done)
    );

endmodule

