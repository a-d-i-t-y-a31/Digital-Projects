`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2025 21:07:35
// Design Name: 
// Module Name: conv_top_tb
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

module conv_top_tb;

    reg clk = 0;
    reg rst = 1;

    // Instantiate the top module
    conv_top top_inst (
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        #10 rst = 0;         // Release reset
        #1000 $finish;       // Run for some time
    end
    
   

endmodule

