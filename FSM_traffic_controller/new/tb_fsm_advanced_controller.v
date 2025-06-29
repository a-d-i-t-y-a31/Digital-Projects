`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.06.2025 23:49:29
// Design Name: 
// Module Name: tb_fsm_advanced_controller
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


module tb_FSM_advanced_controller;

    // Inputs
    reg clk;
    reg reset;
    reg high_ns;
    reg high_ew;

    // Outputs
    wire [2:0] ns_light;
    wire [2:0] ew_light;

    // Instantiate the DUT
    FSM_advanced_controller uut (
        .clk(clk),
        .reset(reset),
        .high_ns(high_ns),
        .high_ew(high_ew),
        .ns_light(ns_light),
        .ew_light(ew_light)
    );

    // Clock generator: 10ns period (100 MHz)
    always #5 clk = ~clk;

    // Task to display current light status
    task print_status;
        $display("Time: %0t | NS: R=%b Y=%b G=%b | EW: R=%b Y=%b G=%b | high_ns=%b, high_ew=%b",
                 $time,
                 ns_light[2], ns_light[1], ns_light[0],
                 ew_light[2], ew_light[1], ew_light[0],
                 high_ns, high_ew);
    endtask

    // Test sequence
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        high_ns = 0;
        high_ew = 0;

        // Apply reset
        #20;
        reset = 0;

        // Let system run with low traffic
        $display("\n--- Scenario 1: LOW TRAFFIC ---");
        repeat (30) begin
            #10;
            print_status();
        end

        // Apply high NS traffic
        $display("\n--- Scenario 2: HIGH NORTH-SOUTH TRAFFIC ---");
        high_ns = 1;
        repeat (40) begin
            #10;
            print_status();
        end

        // Apply high EW traffic
        $display("\n--- Scenario 3: HIGH EAST-WEST TRAFFIC ---");
        high_ns = 0;
        high_ew = 1;
        repeat (40) begin
            #10;
            print_status();
        end

        // Apply high traffic on both
        $display("\n--- Scenario 4: HIGH TRAFFIC ON BOTH SIDES ---");
        high_ns = 1;
        high_ew = 1;
        repeat (40) begin
            #10;
            print_status();
        end

        // Back to low traffic
        $display("\n--- Scenario 5: LOW TRAFFIC AGAIN ---");
        high_ns = 0;
        high_ew = 0;
        repeat (30) begin
            #10;
            print_status();
        end

        $display("Test completed at time %0t", $time);
        $finish;
    end

endmodule

