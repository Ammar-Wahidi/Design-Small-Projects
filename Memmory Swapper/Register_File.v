`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 02:10:44 PM
// Design Name: 
// Module Name: Register_File
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


module Register_File #(parameter addr_w_N = 7, data_w_Bits = 8)(
input clk, we,
input [addr_w_N-1:0] address_w,address_r,
input [data_w_Bits-1:0] data_w ,
output[data_w_Bits-1:0] data_r
    );
    reg [data_w_Bits-1:0] memory [0:(2**addr_w_N)-1];

    //next state logic 
    always @(posedge clk)
    begin
    if (we)
    memory[address_w] <= data_w;
    end
    
    assign data_r= memory[address_r];
endmodule
