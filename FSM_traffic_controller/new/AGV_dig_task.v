`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.03.2025 14:51:46
// Design Name: 
// Module Name: AGV_dig_task
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
// MSB of S if 0 means logical operation 1 means arithmetic operation
// Rectify subtraction part
//////////////////////////////////////////////////////////////////////////////////


module AGV_dig_task(
    input [1:0] A, 
    input [1:0] B, 
    input Cin, 
    input [2:0] S, 
    output [3:0] Y
);
    // addition done in 3 bits, sign bit in 4th bit, 1 if positive, 0 if 2s complement
    wire complement_2;
    assign complement_2 = (S == 3'b101) ? 1 : 0;
    wire[3:0] A_cin_sum;
    wire cout1, cout2;
    wire[2:0] mod_B;
    wire[3:0] tot_sum;
    xor G1 (mod_B[0], B[0], complement_2), 
        G2(mod_B[1], B[1], complement_2), 
        G3(mod_B[2], 0, complement_2); // the third bit of B is 0
    adder4 A0 (A_cin_sum, cout1, {2'b00, A}, {3'b000, Cin}, 1'b0); // adds A and cin
    adder4 A1 (tot_sum, cout2, A_cin_sum, {1'b0, mod_B}, complement_2); // adds sum of A and Cin to the value of modified B
    
    wire [3:0]mult;
    multiplier2x2 M1(A, B, mult);
    
     
    
    assign Y = (S == 3'b000) ? {2'b00, A[1] & B[1], A[0] & B[0]} :  // Bitwise AND
               (S == 3'b001) ? {2'b00, A[1] | B[1], A[0] | B[0]} :  // Bitwise OR
               (S == 3'b010) ? {2'b00, A[1] ^ B[1], A[0] ^ B[0]} :  // Bitwise XOR
               (S == 3'b011) ? {2'b00, ~A[1], ~A[0]} :              // Bitwise NOT
               (S == 3'b100) ?  tot_sum :                           // Addition
               (S == 3'b101) ?  tot_sum :                           // Subtraction
               (S == 3'b110) ?  mult :                              // Multiplication
               (S == 3'b111) ? {3'b000, (A > B)} :                  // Compare A > B (1 if true, 0 if false)
               4'b0000; // Default case to avoid unknown values

endmodule

