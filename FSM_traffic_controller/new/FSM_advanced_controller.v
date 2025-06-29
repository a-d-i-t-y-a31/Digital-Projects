`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.02.2025 22:27:18
// Design Name: 
// Module Name: FSM_advanced_controller
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


module FSM_advanced_controller (
    input wire clk,
    input wire reset,
    input wire high_ns,       // High traffic on North-South
    input wire high_ew,       // High traffic on East-West
    output reg [2:0] ns_light, // {Red, Yellow, Green}
    output reg [2:0] ew_light
);

// State encoding
parameter S0 = 2'b00; // NS Green, EW Red
parameter S1 = 2'b01; // NS Yellow, EW Red
parameter S2 = 2'b10; // NS Red, EW Green
parameter S3 = 2'b11; // NS Red, EW Yellow

// Timing parameters
parameter SHORT_GREEN = 5;
parameter LONG_GREEN  = 10;
parameter YELLOW_TIME = 2;

reg [1:0] current_state, next_state;
reg [3:0] timer;
reg [3:0] green_duration;

// State update
always @(posedge clk or posedge reset) begin
    if (reset)
        current_state <= S0;
    else
        current_state <= next_state;
end

// Timer and green duration control
always @(posedge clk or posedge reset) begin
    if (reset)
        timer <= 0;
    else begin
        case (current_state)
            S0: begin
                green_duration <= (high_ns ? LONG_GREEN : SHORT_GREEN);
                if (timer < green_duration)
                    timer <= timer + 1;
                else
                    timer <= 0;
            end
            S2: begin
                green_duration <= (high_ew ? LONG_GREEN : SHORT_GREEN);
                if (timer < green_duration)
                    timer <= timer + 1;
                else
                    timer <= 0;
            end
            S1, S3: begin
                if (timer < YELLOW_TIME)
                    timer <= timer + 1;
                else
                    timer <= 0;
            end
            default: timer <= 0;
        endcase
    end
end

// Next state logic
always @(*) begin
    case (current_state)
        S0: if (timer >= green_duration) next_state = S1;
            else next_state = S0;
        S1: if (timer >= YELLOW_TIME) next_state = S2;
            else next_state = S1;
        S2: if (timer >= green_duration) next_state = S3;
            else next_state = S2;
        S3: if (timer >= YELLOW_TIME) next_state = S0;
            else next_state = S3;
        default: next_state = S0;
    endcase
end

// Output logic
always @(*) begin
    case (current_state)
        S0: begin
            ns_light = 3'b001; // Green
            ew_light = 3'b100; // Red
        end
        S1: begin
            ns_light = 3'b010; // Yellow
            ew_light = 3'b100; // Red
        end
        S2: begin
            ns_light = 3'b100; // Red
            ew_light = 3'b001; // Green
        end
        S3: begin
            ns_light = 3'b100; // Red
            ew_light = 3'b010; // Yellow
        end
        default: begin
            ns_light = 3'b100; // Default to Red
            ew_light = 3'b100;
        end
    endcase
end

endmodule

