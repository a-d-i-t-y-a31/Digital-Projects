`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.03.2025 21:49:47
// Design Name: 
// Module Name: multiplier2x2
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


module multiplier2x2(
    input [1:0] A,
    input [1:0] B,
    output [3:0] Y
);

    wire t1, t2, t3, carry;

    // Partial products
    and G1(Y[0], A[0], B[0]);  // Y[0] = A0 * B0
    and G2(t1, A[1], B[0]);     // t1 = A1 * B0
    and G3(t2, A[0], B[1]);     // t2 = A0 * B1
    and G4(t3, A[1], B[1]);     // t3 = A1 * B1

    // Sum and Carry
    xor G5(Y[1], t1, t2);       // Y[1] = A1B0 ? A0B1
    and G6(carry, t1, t2);      // carry = A1B0 & A0B1
    xor G7(Y[2], carry, t3);    // Y[2] = (A1B0 & A0B1) ? A1B1
    assign Y[3] = carry;           // Y[3] = A1 * B1 (MSB)

endmodule