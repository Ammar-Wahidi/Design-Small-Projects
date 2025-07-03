`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 03:32:13 PM
// Design Name: 
// Module Name: Memory_Swapper
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


module Memory_Swapper #(parameter addr_w_N = 7, data_w_Bits = 8)(
input clk,reset_n ,swap,
input we,
input [addr_w_N-1:0] address_r,address_w,
input [data_w_Bits-1:0] data_w,
input [addr_w_N-1:0] address_A,address_B,
output[data_w_Bits-1:0] data_r
    );
    wire [1:0] sel;
    wire w;
    Mem_swap_control controller (
    .clk(clk),
    .reset_n(reset_n),
    .swap(swap),
    .sel(sel),
    .w(w)
    );
    wire [addr_w_N-1:0] adress_out_r_mux;
    twomux2 #(.addr_w_N(addr_w_N),.data_w_Bits(data_w_Bits)) mux0 (
    .each(1'b0),
    .sel(sel),
    .address_w(address_w),
    .address_r(address_r),
    .address_A(address_A),
    .address_B(address_B),
    .adress_out_r(adress_out_r_mux)
    );
    wire [addr_w_N-1:0] adress_out_w_mux;    
     twomux #(.addr_w_N(addr_w_N),.data_w_Bits(data_w_Bits)) mux1 (
    .each(1'b1),
    .sel(sel),
    .address_w(address_w),
    .address_r(address_r),
    .address_A(address_A),
    .address_B(address_B),
    .adress_out_w(adress_out_w_mux)
    );
    wire we_out_mux;
    twosmallmux2 #(.addr_w_N(addr_w_N),.data_w_Bits(data_w_Bits)) mux2(
    .we(we),
    .each(1'b0),
    .w(w),
    .data_w(data_w),
    .data_r(data_r),
    .we_out(we_out_mux)
    );
    wire [data_w_Bits-1:0] data_w_out_mux;
    twosmallmux #(.addr_w_N(addr_w_N),.data_w_Bits(data_w_Bits)) mux3(
    .we(we),
    .each(1'b1),
    .w(w),
    .data_w(data_w),
    .data_r(data_r),
    .data_w_out(data_w_out_mux)
    );
    
    Register_File #(.addr_w_N(addr_w_N),.data_w_Bits(data_w_Bits)) RF (
    .clk(clk),
    .we(we_out_mux),
    .address_w(adress_out_w_mux),
    .address_r(adress_out_r_mux),
    .data_w(data_w_out_mux),
    .data_r(data_r)
    );
endmodule
