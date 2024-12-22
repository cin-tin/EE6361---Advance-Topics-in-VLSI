`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2022 15:28:13
// Design Name: 
// Module Name: prog_mem
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


module prog_mem(le,addr_in,inst_in,inst_out);
input le;
input [4:0]addr_in;
input [27:0]inst_in;
output [27:0]inst_out;

wire[4:0] address;
reg [27:0] mem[31:0];
reg [27:0]out;
assign inst_out=out;

always@(*)
begin
if(le==1)
mem[addr_in]=inst_in;
if(le==0) 
begin
out=mem[addr_in];
end
end

endmodule
