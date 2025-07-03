`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 06:30:37 PM
// Design Name: 
// Module Name: twomux2
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


module twomux2 #(parameter addr_w_N = 7, data_w_Bits = 8) (
input each,
input [1:0]sel,
input [addr_w_N-1:0] address_w, address_r,
input [addr_w_N-1:0] address_A,address_B,
output reg [addr_w_N-1:0] adress_out_w,adress_out_r
    );         
   always @(*)
   begin
   case (sel)
   0:adress_out_r = address_r;
   1:adress_out_r = address_A;
   2:adress_out_r = address_B;
   3:adress_out_r = 0;
   default: adress_out_r = address_r;
   endcase
   end
endmodule
