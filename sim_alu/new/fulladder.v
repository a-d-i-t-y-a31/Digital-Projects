`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.12.2024 17:44:22
// Design Name: 
// Module Name: fulladder
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


module fulladder(
    output s,
    output cout,
    input x,
    input y,
    input cin
    );
    
    wire s1, c1, c2;
    xor G1 (s1, x, y), G2(s, s1, cin), G3(cout, c2, c1);
    and G4 (c1, x, y), G5(c2, s1, cin); 
endmodule
