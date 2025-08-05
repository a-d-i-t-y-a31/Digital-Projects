`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2025 01:16:36
// Design Name: 
// Module Name: mac_tb
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



module mac_tb;

    reg [7:0] px0, px1, px2, px3, px4, px5, px6, px7, px8;
    reg signed [7:0] wt0, wt1, wt2, wt3, wt4, wt5, wt6, wt7, wt8;
    wire signed [31:0] mac_out;

    mac uut (
        .px0(px0), .px1(px1), .px2(px2),
        .px3(px3), .px4(px4), .px5(px5),
        .px6(px6), .px7(px7), .px8(px8),

        .wt0(wt0), .wt1(wt1), .wt2(wt2),
        .wt3(wt3), .wt4(wt4), .wt5(wt5),
        .wt6(wt6), .wt7(wt7), .wt8(wt8),

        .mac_out(mac_out)
    );

    initial begin
        // Set all pixels = 1
        px0 = 1; px1 = 1; px2 = 1;
        px3 = 1; px4 = 1; px5 = 1;
        px6 = 1; px7 = 1; px8 = 1;
        #5
        // Weights: [1, 0, -1, 1, 0, -1, 1, 0, -1]
        wt0 =  1; wt1 =  0; wt2 = -8'd1;
        wt3 =  1; wt4 =  0; wt5 = -8'd1;
        wt6 =  1; wt7 =  0; wt8 = -8'd1;
        #5
        wt0 =  0; wt1 =  0; wt2 = 0;
        wt3 =  0; wt4 =  0; wt5 = 0;
        wt6 =  0; wt7 =  0; wt8 = 0;
        #5
        wt0 =  5; wt1 =  -2; wt2 = 10;
        wt3 =  12; wt4 =  -15; wt5 = -20;
        wt6 =  13; wt7 =  -5; wt8 = 6;
        
        #10;  // Wait a little
        $display("MAC Output = %d", mac_out); 
        $finish;
    end

endmodule

