`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.11.2022 11:19:56
// Design Name: 
// Module Name: control_unit
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


module control_unit(inst_cu,le_cu,addr_cu);

input [27:0] inst_cu;
input le_cu;
input addr_cu;

wire [7:0] addr;
wire [27:0] ins;
wire [4:0] addr_cu,pc_cu;
wire le_cu;

assign addr=le_cu?addr_cu:pc_cu;

eucl  e(.instruction(ins),.le_pm(le_cu),.prog_counter(pc_cu));
prog_mem p(.le(le_cu),.addr_in(addr),.inst_in(inst_cu),.inst_out(ins));
endmodule
