`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2024 12:04:36
// Design Name: 
// Module Name: alutest
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


module alutest();
    reg[15:0] X,Y;
    wire[15:0] Z;
    wire S, ZR, CY, P, V;
    
    ALU DUT(X, Y, Z, S, ZR, CY, P, V);
    
    initial
        begin
            $monitor($time, "X=%h, Y=%h, Z=%h, S=%b, ZR=%b, CY=%b, P=%b, V=%b", X,Y,Z,S,ZR,CY,P,V);
            #5 X = 16'h8fff; Y = 16'h8000;
            #5 X = 16'hfffe; Y = 16'h0002;
            #5 X = 16'hAAAA; Y = 16'h5555;
            #5 $finish;
        end
endmodule
