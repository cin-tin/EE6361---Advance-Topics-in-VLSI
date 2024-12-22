`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2022 15:56:47
// Design Name: 
// Module Name: control_unit_tb
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


module control_unit_tb();

reg [27:0] inst_tb;
reg le_tb;
reg [4:0] addr_tb;


initial 
begin
le_tb = 1;

//addr_tb=0;
//inst_tb=28'h00051500;
//#1
//addr_tb=1;
//inst_tb=28'h00061600;
//#1
//addr_tb=2;
//inst_tb=28'h00071700;
//#1
//addr_tb=3;
//inst_tb=28'h01080506;
//#1
//addr_tb=4;
//inst_tb=28'h02090506;
//#1
//addr_tb=5;
//inst_tb=28'h03090000;

//#1
//addr_tb=6;
//inst_tb=28'h04050600;

//#1
//addr_tb=7;
//inst_tb=28'h05090a00;

//#1
//addr_tb=8;
//inst_tb=28'h06050000;


//prob 1a
addr_tb=0;
inst_tb=28'h00048d00;

#1

//prob1b
addr_tb=1;
inst_tb=28'h0006d000;

#1
//prob 1c
addr_tb=2;
inst_tb=28'h00082000;

#1
//prob 2a
addr_tb=3;
inst_tb=28'h05040500;

#1
//prob2b
addr_tb=4;
inst_tb=28'h05080900;

#1
//prob2c 
addr_tb=5;
inst_tb=28'h05060700;

#1
//prob3
addr_tb=6;
inst_tb=28'h01100406;

//prob4
#1
addr_tb=7;
inst_tb=28'h02110608;

//prob5
#1
addr_tb=8;
inst_tb=28'h02120804;

#1
//prob6
addr_tb=9;
inst_tb=28'h03120000;

#1
//prob7
addr_tb=9;
inst_tb=28'h04040600;

#1
//prob8
addr_tb=10;
inst_tb=28'h02130404;

#1
le_tb = 0;

#20 $finish;

end
control_unit cu(.inst_cu(inst_tb),.le_cu(le_tb),.addr_cu(addr_tb));

endmodule
