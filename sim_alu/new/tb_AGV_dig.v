`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2025 15:16:56
// Design Name: 
// Module Name: tb_AGV_dig
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


module tb_AGV_dig();
    reg [1:0] A;
    reg [1:0] B;
    reg Cin;
    reg [2:0] S;
    wire [3:0] Y;
    AGV_dig_task dut(A,B,Cin,S,Y);
    
    initial
        begin
            $monitor($time, "A=%h, B=%h, Cin=%b, S=%h, Y=%h",A,B,Cin,S,Y);
            #2 S=3'b000; A=2'b11; B=2'b11; Cin = 0;
            #2 S=3'b001;
            #2 S=3'b010;
            #2 S=3'b011;
            #2 S=3'b100;
            #2 S=3'b101;
            #2 S=3'b110;
            #2 S=3'b111;
            #2 $finish; 
        end
endmodule
