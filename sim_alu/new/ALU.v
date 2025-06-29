`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2024 11:56:31
// Design Name: 
// Module Name: ALU
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


module ALU(
    input[15:0] X,
    input[15:0] Y,
    output[15:0] Z,
    output Sign,
    output Zero,
    output Carry,
    output Parity,
    output Overflow
    );
    
    wire[3:1] c;
    
    
    assign Sign = Z[15];
    assign Zero = ~|Z;
    assign Parity = ~^Z;
    assign Overflow = (X[15] & Y[15] & ~Z[15])|(~X[15] & ~Y[15] & Z[15]);
    //assign {Carry,Z} = X + Y ;
    adder4 A0 (Z[3:0], c[1], X[3:0], Y[3:0], 1'b0);
    adder4 A1 (Z[7:4], c[2], X[7:4], Y[7:4], c[1]);
    adder4 A2 (Z[11:8], c[3], X[11:8], Y[11:8], c[2]);
    adder4 A3 (Z[15:12], Carry, X[15:12], Y[15:12], c[3]);
endmodule
