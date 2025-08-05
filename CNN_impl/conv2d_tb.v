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
// Dependencies: conv2d.v window_buffer.v mac.v
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module conv2d_tb;

    reg clk, rst;
    reg [7:0] pixel_in;
    wire signed [31:0] conv_out;
    wire valid;

    parameter WIDTH = 5;
    parameter HEIGHT = 5;

    // Instantiate convolution top module
    conv2d #(.IMG_WIDTH(WIDTH)) dut (
        .clk(clk),
        .rst(rst),
        .pixel_in(pixel_in),
        .valid(valid),
        .conv_out(conv_out)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test image: 5x5 (values 0 to 24)
    reg [7:0] image [0:24];
    integer i;

    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0;

        // Initialize image with sequential values
        for (i = 0; i < 25; i = i + 1) begin
            image[i] = i;
        end

        // Feed pixels one at a time
        for (i = 0; i < 25; i = i + 1) begin
            pixel_in = image[i];
            #10;
            if (valid) begin
                $display("Conv output at pixel[%0d]: %0d", i, conv_out);
            end
        end

        $finish;
    end

endmodule
