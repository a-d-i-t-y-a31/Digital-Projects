`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2025 22:44:14
// Design Name: 
// Module Name: tb_multiplier2x2
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


module tb_multiplier2x2();
    reg [1:0] A;
    reg [1:0] B;
    wire [3:0] Y;
    multiplier2x2 M1(A, B, Y);
    initial
        begin
            $monitor($time, "A=%h, B=%h, Y=%h",A,B,Y);
            #2 A=2'b00; B = 2'b00;
            #2 A=2'b01; B = 2'b00;
            #2 A=2'b10; B = 2'b00;
            #2 A=2'b11; B = 2'b00;
            #2 A=2'b00; B = 2'b01;
            #2 A=2'b01; B = 2'b01;
            #2 A=2'b10; B = 2'b01;
            #2 A=2'b11; B = 2'b01;
            #2 A=2'b00; B = 2'b10;
            #2 A=2'b01; B = 2'b10;
            #2 A=2'b10; B = 2'b10;
            #2 A=2'b11; B = 2'b10;
            #2 A=2'b00; B = 2'b11;
            #2 A=2'b01; B = 2'b11;
            #2 A=2'b10; B = 2'b11;
            #2 A=2'b11; B = 2'b11;
        end

endmodule
