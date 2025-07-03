`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 01:17:22 PM
// Design Name: 
// Module Name: button
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


module button(
input clk,rst_n,
input noisy,
output debounced,
output p_edge, n_edge, _edge
    );
    
    top_debounced dd (
    .clk(clk),
    .reset_n(rst_n),
    .noisy(noisy),
    .debounced(debounced)
    );
    
    edge_detector edgedec(
    .clk(clk),
    .reset_n(rst_n),
    .level(debounced),
    .p_edge(p_edge),
    .n_edge(n_edge),
    ._edge(_edge)
    );
    
endmodule
