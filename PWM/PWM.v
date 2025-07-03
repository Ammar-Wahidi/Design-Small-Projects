`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2025 09:47:46 PM
// Design Name: 
// Module Name: PWM
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


module PWM #(parameter bits =4,parameter R =8 ) (
input [bits-1:0]final_value,
input clk,rst_n,enable,
output PWM_out
    );
    wire done_enable;
    timer #(.bits(bits)) timer0 (
    .enable(enable),
    .clk(clk),
    .rst_n(rst_n),
    .final_value(final_value),
    .done(done_enable)
    );
    
    wire d;
    Basic_PWMimproved  #(.R(R)) basicPWM(
    .clk(clk),
    .reset_n(rst_n),
    .duty(duty),
    .enable(done_enable),
    .d(d)
    );
    
    reg PWM_out_reg;
    always @(posedge clk or negedge rst_n)
    begin
    if (~rst_n)
    begin
    PWM_out_reg=0;
    end
    else
    begin
    PWM_out_reg=d;
    end
    end
    assign PWM_out = PWM_out_reg;
    
    
endmodule
