`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2025 09:47:12 PM
// Design Name: 
// Module Name: timer
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


module timer#(parameter bits =4)(
input clk,rst_n,enable,
input [bits-1:0] final_value ,
output done
    );
    reg [bits -1 :0] Q_reg , Q_next;
    
    always @(posedge clk or negedge rst_n)
    begin
    if (~rst_n)
    begin
    Q_reg<=0;
    end
    else if (enable)
    begin
    Q_reg <= Q_next;
    end
    else
    begin
    Q_reg <= Q_reg;
    end
    end
    
    
    
    
    assign done = (Q_reg == final_value);
    
        always @(*)
        Q_next = done? 'b0: Q_reg + 1;
        
endmodule
