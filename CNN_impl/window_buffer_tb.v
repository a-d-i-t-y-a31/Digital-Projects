`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2025 02:02:44
// Design Name: 
// Module Name: window_buffer_tb
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


module window_buffer_tb;

    reg clk, rst;
    reg [7:0] pixel_in;
    wire valid;
    wire [7:0] w0, w1, w2,
               w3, w4, w5,
               w6, w7, w8;

    parameter WIDTH = 5;
    parameter HEIGHT = 5;

    // DUT instantiation
    window_buffer #(.IMG_WIDTH(WIDTH)) uut (
        .clk(clk),
        .rst(rst),
        .pixel_in(pixel_in),
        .valid(valid),
        .w0(w0), .w1(w1), .w2(w2),
        .w3(w3), .w4(w4), .w5(w5),
        .w6(w6), .w7(w7), .w8(w8)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test image
    reg [7:0] test_img [0:24];
    integer i;

    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0;

        // Initialize test image: 5×5, values 0–24
        for (i = 0; i < 25; i = i + 1) begin
            test_img[i] = i;
        end

        // Feed pixels one at a time
        for (i = 0; i < 25; i = i + 1) begin
            pixel_in = test_img[i];
            #10;
            if (valid) begin
                $display("3x3 window at pixel[%0d]:", i);
                $display("%0d %0d %0d", w0, w1, w2);
                $display("%0d %0d %0d", w3, w4, w5);
                $display("%0d %0d %0d\n", w6, w7, w8);
            end
        end

        $finish;
    end

endmodule
