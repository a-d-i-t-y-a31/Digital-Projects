`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2025 21:00:12
// Design Name: 
// Module Name: conv_ctrl
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


module conv_ctrl(
    input clk,
    input rst,
    output reg [7:0] pixel_out,
    input wire signed [31:0] conv_out,
    input wire valid,

    output reg done
);

    // Test image (5x5) stored locally
    reg [7:0] image [0:24];
    reg [5:0] img_index;  // 0 to 24
    integer i;

    // Feature map buffer (3x3)
    reg signed [31:0] out_map [0:2][0:2];
    reg [1:0] out_row, out_col;
    
    

    always @(posedge clk) begin
        if (rst) begin
            img_index <= 0;
            done <= 0;
            out_row <= 0;
            out_col <= 0;

            // Initialize image
            for (i = 0; i < 25; i = i + 1) begin
                image[i] <= i;
            end
        end 
        else begin
            // Feed pixel into conv2d
            if (img_index < 25) begin
                pixel_out <= image[img_index];
                img_index <= img_index + 1;
            end

            // On valid output from conv2d
            if (valid) begin
                out_map[out_row][out_col] <= conv_out;

                // Update output pixel coordinate
                if (out_col == 2) begin
                    out_col <= 0;
                    out_row <= out_row + 1;
                end 
                else begin
                    out_col <= out_col + 1;
                end

                if (out_row == 2 && out_col == 2)
                    done <= 1;
            end
            
            if (valid) begin
                $display("Output at (%0d, %0d) = %d", out_row, out_col, conv_out);
            end

            if (done) begin
                $display("? Feature map complete.");
                $finish;
            end
        end
    end
    
    
endmodule

