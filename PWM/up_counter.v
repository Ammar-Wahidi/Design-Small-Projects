`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2025 09:02:05 PM
// Design Name: 
// Module Name: up_counter
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


module up_counter(
input clk,
input rst_n, enable,
output Q
    );
    
    reg Q_reg;
    reg Q_next;
    
    always @(posedge clk or negedge rst_n)
    begin
    if (~rst_n)
    begin
    Q_reg<=0;
    end
    else if (enable)
    begin
    Q_reg<=Q_next;
    end
    else
    begin
    Q_reg<=Q_reg;
    end
    end
    
    always @(*)
    begin
    Q_next =Q_reg+1;
    end    
    
    assign Q=Q_reg;
    
endmodule
