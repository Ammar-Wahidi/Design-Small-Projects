`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/14/2025 10:06:47 PM
// Design Name: 
// Module Name: Traffic_light_Controller
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


module Traffic_light_Controller(
input clk,reset_n,
input sa,sb,
output reg Ra,Ya,Ga,Rb,Yb,Gb
    );
    parameter s0=0,s1=1,s2=2,s3=3,s4=4,s5=5,s6=6,s7=7,s8=8,s9=9,s10=10,s11=11,s12=12;
    reg [3:0] state , next_state;
    //next stsae logic
    always @(*)
    begin
    case (state)
    s0: next_state= s1;
    s1: next_state= s2;
    s2: next_state= s3;
    s3: next_state= s4;
    s4: next_state= s5;
    s5: next_state= (sb)? s6:s5;
    s6: next_state= s7;
    s7: next_state= s8;
    s8: next_state= s9;
    s9: next_state= s10;
    s10:next_state= s11;
    s11:
    begin
    if (!sa & sb)
     next_state= s11;
     else 
     next_state= s12;
     end
    s12: next_state= s0;
    default :next_state=s0;
    endcase
    end 
    //register state
    always @(posedge clk or negedge reset_n)
    begin
    if (~reset_n)
        state <= s0;
    else
    state <= next_state;
    end
    //output logic
    always @(*)
    begin
    case (state)
    s0: begin
    Ra=0;Ya=0;Ga=1;Rb=1;Yb=0;Gb=0;
    end
    s1: begin
    Ra=0;Ya=0;Ga=1;Rb=1;Yb=0;Gb=0;
    end 
    s2: begin
    Ra=0;Ya=0;Ga=1;Rb=1;Yb=0;Gb=0; 
    end
    s3: begin
    Ra=0;Ya=0;Ga=1;Rb=1;Yb=0;Gb=0; 
    end
    s4: begin
    Ra=0;Ya=0;Ga=1;Rb=1;Yb=0;Gb=0; 
    end
    s5: begin
    Ra=0;Ya=0;Ga=1;Rb=1;Yb=0;Gb=0; 
    end
    s6: begin
    Ra=0;Ya=1;Ga=0;Rb=1;Yb=0;Gb=0;
    end 
    s7: begin
    Ra=1;Ya=0;Ga=0;Rb=0;Yb=0;Gb=1;
    end 
    s8:begin
    Ra=1;Ya=0;Ga=0;Rb=0;Yb=0;Gb=1; 
    end
    s9: begin
    Ra=1;Ya=0;Ga=0;Rb=0;Yb=0;Gb=1; 
    end
    s10: begin
    Ra=1;Ya=0;Ga=0;Rb=0;Yb=0;Gb=1;
    end
    s11:begin
    Ra=1;Ya=0;Ga=0;Rb=0;Yb=0;Gb=1;
    end
    s12:begin
    Ra=1;Ya=0;Ga=0;Rb=0;Yb=1;Gb=0;
    end
    default: begin
        Ra=0;Ya=1;Ga=0;Rb=1;Yb=0;Gb=0;
    end
    endcase    
    end
    
endmodule
