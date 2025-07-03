`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 02:48:53 PM
// Design Name: 
// Module Name: twosmallmux
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


module twosmallmux #(parameter addr_w_N = 7, data_w_Bits = 8)(
input we,each,w,
input [data_w_Bits-1:0] data_w , data_r,
output reg we_out , 
output reg [data_w_Bits-1:0] data_w_out
    );
    
always @(*) begin
    

         if (each) begin
            if (w)
            begin
                we_out = 1;
                data_w_out = data_r;
                end
            else
            begin
                we_out = we;
                data_w_out = data_w;
            end
        end
    end

endmodule
