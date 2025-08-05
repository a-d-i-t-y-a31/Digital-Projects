`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.07.2025 01:11:04
// Design Name: 
// Module Name: mac
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


module mac(
    input [7:0]  px0, px1, px2, px3, px4, px5, px6, px7, px8,
    input signed [7:0] wt0, wt1, wt2, wt3, wt4, wt5, wt6, wt7, wt8,
    output signed [31:0] mac_out
);

    wire signed [15:0] products [0:8];
    reg signed [31:0] mac_out_reg;

    assign products[0] = $signed(px0) * wt0;
    assign products[1] = $signed(px1) * wt1;
    assign products[2] = $signed(px2) * wt2;
    assign products[3] = $signed(px3) * wt3;
    assign products[4] = $signed(px4) * wt4;
    assign products[5] = $signed(px5) * wt5;
    assign products[6] = $signed(px6) * wt6;
    assign products[7] = $signed(px7) * wt7;
    assign products[8] = $signed(px8) * wt8;

    always @(*) begin
        mac_out_reg = products[0] + products[1] + products[2] +
                      products[3] + products[4] + products[5] +
                      products[6] + products[7] + products[8];
    end

    assign mac_out = mac_out_reg;

endmodule

