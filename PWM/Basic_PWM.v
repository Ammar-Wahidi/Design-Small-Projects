`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2025 08:59:06 PM
// Design Name: 
// Module Name: Basic_PWM
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


module Basic_PWM #(parameter R=8)(
input clk,
input reset_n,
input [R:0] duty,
output PWM_out
    );
    wire ctoc;
    up_counter counter (
    .clk(clk),
    .rst_n(reset_n),
    .Q(ctoc)
    );
    
    assign PWM_out = (ctoc<duty);
endmodule
