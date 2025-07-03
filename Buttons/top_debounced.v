`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 11:32:46 AM
// Design Name: 
// Module Name: top_debounced
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


module top_debounced(
input clk ,reset_n, noisy,
output debounced
    );
    wire timer_done , timer_reset;
    timer #(.bits(21)) t (
    .clk(clk),
    .rst_n(~timer_reset),
    .enable(~timer_reset),
    .final_value(2000000),
    .done(timer_done)
    );
    debouncedButtons d (
    .clk(clk),
    .reset_n(reset_n),
    .noisy(noisy),
    .timer_reset(timer_reset),
    .timer_done(timer_done),
    .debounced(debounced)
    );
endmodule
