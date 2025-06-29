`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2025 17:30:46
// Design Name: 
// Module Name: tb_FSM_traffic_control
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


module tb_FSM_traffic_control( );
    
    reg clock;
    reg reset;
    reg[0:2] light;
    
//    FSM_traffic_controller dut(
//        .clock(clock),
//        .reset(reset),
//        .red(red),
//        .green(green),
//        .yellow(yellow));
    FSM_traffic_controller dut(clock, reset, light);
    
    initial
        begin
            clock = 0;
            repeat (20)
                begin
                    #5 clock = 1; #5 clock = 0;
                end
        end
     //Just comment this out for testing better implementation   
    /*initial
        begin
            reset = 0;
            #50 reset = 1;
            #10 reset = 0;
        end
    */
    // Monitor state changes
    initial begin
        $monitor("Time: %0t | RED: %b | YELLOW: %b | GREEN: %b", 
                  $time, red, yellow, green);
    end
    
endmodule
