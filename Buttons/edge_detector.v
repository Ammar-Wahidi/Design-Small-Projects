`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 01:03:30 PM
// Design Name: 
// Module Name: edge_detector
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


module edge_detector(
input clk,reset_n,
input level,
output p_edge , n_edge , _edge

    );
    
    parameter s0 =0, s1=1;
    reg state , next_state;
    //next stage logic
    always @(*)
    begin
    case (state)
    s0: next_state= (level)? s1:s0;
    s1: next_state= (level)? s1:s0;
    default : next_state =s0;
    endcase
    end
    //state register
     always @(posedge clk or negedge reset_n)
     begin
     if (~ reset_n)
     state <= s0;
     else
     state <= next_state;
     end
    //output logic 
    assign p_edge = (state == s0 && level);
    assign n_edge = (state == s1 && ~level);
    assign _edge = p_edge || n_edge ;
endmodule
