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


module Basic_PWMimproved #(parameter R=8)(
input clk,
input reset_n,
input [R:0] duty,
input enable,
output d
    );
    wire ctoc;
    up_counter counter (
    .enable(enable),
    .clk(clk),
    .rst_n(reset_n),
    .Q(ctoc)
    );
    
    assign d = (ctoc<duty);
endmodule
