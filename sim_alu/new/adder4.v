`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2024 17:36:13
// Design Name: 
// Module Name: adder4
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


module adder4(
    output[3:0] S,
    output cout,
    input[3:0] X,
    input[3:0] Y,
    input cin
    );
    wire[3:1] c;
    
    fulladder FA0 (S[0], c[1], X[0], Y[0], cin);
    fulladder FA1 (S[1], c[2], X[1], Y[1], c[1]);
    fulladder FA2 (S[2], c[3], X[2], Y[2], c[2]);  
    fulladder FA3 (S[3], cout, X[3], Y[3], c[3]);
endmodule
