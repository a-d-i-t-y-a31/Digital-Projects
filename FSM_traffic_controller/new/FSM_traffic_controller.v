`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2025 13:28:18
// Design Name: 
// Module Name: FSM_traffic_controller
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


/*module FSM_traffic_controller(
    input clock,
    input reset,
    output red, yellow, green
    );
    parameter  RED=2'b00, // Red light
    GREEN=2'b01, // Green light
    YELLOW=2'b10; // Yellow light

    reg[1:0] current_state = RED, next_state = RED; //initialize the current and next state
    reg[3:0] counter = 4'b0; //counter for timing initialised to 0
    
    
        
    always @(posedge clock or posedge reset) begin
        if (reset)
            current_state <= RED;
        else
            current_state <= next_state;
    end
    
    always @(*) begin
        case (current_state)
            RED:    next_state <= (counter == 4'd2) ? GREEN : RED;
            GREEN:  next_state <= (counter == 4'd3) ? YELLOW : GREEN;
            YELLOW: next_state <= (counter == 4'd1)  ? RED : YELLOW;
            default: next_state <= RED;
        endcase
    end
    
    always @(posedge clock or posedge reset) begin
        if (reset)
            counter <= 0;
        else if (current_state != next_state)
            counter <= 0;
        else
            counter <= counter + 1;
    end
    
    assign red    = (current_state == RED);
    assign yellow = (current_state == YELLOW);
    assign green  = (current_state == GREEN);

endmodule*/


//This is better implementation because it generates less latches since everything is 
//generated using state. Light need not be stored and checked, instead light is worked out from state 
//using combinational circuit
module FSM_traffic_controller(
    input clock,
    input reset,
    output reg[0:2] light
    );
    parameter S0=0, S1=1, S2=2;
    parameter RED=3'b100, GREEN=2'b010, YELLOW=3'b001;
    reg[0:1] state;
    always @(posedge clock)
        case(state)
            S0: begin //S0 means red
                    light <= GREEN; state<=S1;
                end
            S1: begin //S1 means green
                    light<=YELLOW; state<=S2;
                end
            S2: begin //S2 means yellow
                    light<=RED; state<=S0;
                end
            default: begin
                        light<=RED; state<=S0;
                     end
         endcase
endmodule