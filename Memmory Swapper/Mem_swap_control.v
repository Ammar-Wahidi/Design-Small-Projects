`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 02:28:37 PM
// Design Name: 
// Module Name: Mem_swap_control
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


module Mem_swap_control(
input clk, reset_n,
input swap,
output reg [1:0] sel, 
output w 
    );
    parameter s0 =0 , s1 =1 , s2 =2 , s3 =3 ;
    reg [1:0] state , next_state;
    //next state logic
    always @(*)
    begin
    case (state)
    s0: next_state = (swap)? s1:s0;
    s1: next_state = s2;
    s2: next_state = s3;
    s3: next_state = s0;
    default next_state = s0;
    endcase
    end 
    // state register 
    always @(posedge clk or negedge reset_n)
    begin
    if (~reset_n)
    state <= s0;
    else
    state <= next_state;
    end
    //output logic 
    assign w = (state !=s0);
    always @(*)
    begin
    case (state)
    s0: sel = 2'b00;
    s1: sel = 2'b01; 
    s2: sel = 2'b10;
    s3: sel = 2'b11;
    endcase
    end
endmodule
