`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 11:09:36 AM
// Design Name: 
// Module Name: debouncedButtons
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


module debouncedButtons(
input clk, reset_n,
input noisy,
input timer_done,
output timer_reset, debounced
    );
    
    parameter s0 =0 , s1=1, s2 =2 , s3=3;
    reg [1:0] state, next_state;
     
    //next state logic
    always @(*)
    begin
    case (state)
    s0: next_state = (noisy)? s1:s0 ;
    s1: begin
    if (!noisy)
    next_state = s0;
    else if (noisy & timer_done)
    next_state = s2;
    else
    next_state= s1;
    end
    s2: next_state = (noisy) ? s2 : s3 ;
    s3:begin
    if (noisy)
    next_state = s2;
    else if (!noisy && timer_done)
    next_state= s0;
    else
    next_state = s3;
    end
    endcase
    end
    //srtate register
    always @(posedge clk or negedge reset_n)
    begin
    if (!reset_n)
    state <= 0;
    else
    state <=next_state;
    end
    //output logic
    assign timer_reset = (state == s0 || state == s2);
    assign debounced = (state == s2 || state ==s3);
endmodule
