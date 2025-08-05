`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2025 01:49:51
// Design Name: 
// Module Name: window_buffer
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


module window_buffer #(
    parameter IMG_WIDTH = 28
)(
    input clk,
    input rst,
    input [7:0] pixel_in,
    output reg valid,
    output [7:0] w0, w1, w2,
                 w3, w4, w5,
                 w6, w7, w8
);

    reg [7:0] line1 [0:IMG_WIDTH-1];  // row N-2
    reg [7:0] line2 [0:IMG_WIDTH-1];  // row N-1

    reg [7:0] shift_reg0 [0:2];  // current row
    reg [7:0] shift_reg1 [0:2];  // previous row
    reg [7:0] shift_reg2 [0:2];  // 2nd previous row

    integer i;
    reg [5:0] col;
    reg [5:0] row;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            col <= 0;
            row <= 0;
            valid <= 0;
        end else begin
            // Shift each row
            shift_reg0[0] <= shift_reg0[1];
            shift_reg0[1] <= shift_reg0[2];
            shift_reg0[2] <= pixel_in;

            shift_reg1[0] <= shift_reg1[1];
            shift_reg1[1] <= shift_reg1[2];
            shift_reg1[2] <= line2[col];

            shift_reg2[0] <= shift_reg2[1];
            shift_reg2[1] <= shift_reg2[2];
            shift_reg2[2] <= line1[col];

            // Update line buffers
            line1[col] <= line2[col];
            line2[col] <= pixel_in;

            // Coordinate update
            if (col == IMG_WIDTH-1) begin
                col <= 0;
                row <= row + 1;
            end else begin
                col <= col + 1;
            end

            valid <= (row >= 2 && col >= 2);
        end
    end

    assign w0 = shift_reg2[0]; assign w1 = shift_reg2[1]; assign w2 = shift_reg2[2];
    assign w3 = shift_reg1[0]; assign w4 = shift_reg1[1]; assign w5 = shift_reg1[2];
    assign w6 = shift_reg0[0]; assign w7 = shift_reg0[1]; assign w8 = shift_reg0[2];

endmodule

