`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2022 14:53:39
// Design Name: 
// Module Name: exectb
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


module execution_unit_tb();
reg [7:0] i;
reg we_tb,re_tb,le_tb;
reg [7:0] din_tb;
reg [4:0] addr_tb;
reg [1:0] fselect_tb;
reg [1:0] sselect_tb;
wire [3:0] flag_register_tb;

//wire [7:0] sresult_tb;
//wire [7:0] dout_tb;
wire [7:0] dbus_tb;

execution_unit h(.we(we_tb),.re(re_tb),.le(le_tb),.addr(addr_tb),.din(din_tb),.dbus(dbus_tb),.fselect(fselect_tb),.sselect(sselect_tb),.flag_register(flag_register_tb));

initial begin 

we_tb=0;
addr_tb=0;
din_tb=0;
re_tb=0;
le_tb=0;
fselect_tb=2'bzz;
sselect_tb=1'bz;

#5
din_tb=15;
le_tb=1; 
#5 le_tb=0;

addr_tb=0;
we_tb=1; #5 we_tb=0;

#5
din_tb=13;
le_tb=1; 
#5 le_tb=0;

addr_tb=1;
we_tb=1; #5 we_tb=0;

addr_tb=16;
re_tb=1; #5 re_tb=0;

fselect_tb=2'b00;
#5 fselect_tb=2'bzz;

fselect_tb=2'b01;
#5 fselect_tb=2'bzz;

fselect_tb=2'b10;
#5 fselect_tb=2'bzz;

fselect_tb=2'b11;
#5 fselect_tb=2'bzz;

sselect_tb=1'b0;
#5 sselect_tb=1'bz;

sselect_tb=1'b1;
#5 sselect_tb=1'bz;

//problem 1a
le_tb=1;
din_tb=141;
#5 le_tb=0;
addr_tb=4;
we_tb=1;
#5 we_tb=0;

//1b
le_tb=1;
din_tb=208;
#5 le_tb=0;
addr_tb=6;
we_tb=1;
#5 we_tb=0;

//1c
le_tb=1;
din_tb=32;
#5 le_tb=0;
addr_tb=8;
we_tb=1;
#5 we_tb=0;

//problem 2a
re_tb=1;
addr_tb=4;
#5 re_tb=0;

we_tb=1;
addr_tb=5;
#5 we_tb=0;

//2b
re_tb=1;
addr_tb=8;
#5 re_tb=0;

we_tb=1;
addr_tb=9;
#5 we_tb=0;

//2c
re_tb=1;
addr_tb=6;
#5 re_tb=0;

we_tb=1;
addr_tb=7;
#5 we_tb=0;

//problem3
re_tb=1;
addr_tb=4;
#5 re_tb=0;
we_tb=1;
addr_tb=0;
#5 we_tb=0;

re_tb=1;
addr_tb=6;
# 5re_tb=0;
we_tb=1;
addr_tb=1;
#5 we_tb=0;

fselect_tb=2'b00;
#5 fselect_tb=2'bzz;

re_tb=1;
addr_tb=2;
#5 re_tb=0;
we_tb=1;
addr_tb=10;
#5 we_tb=0;

//problem4
re_tb=1;
addr_tb=6;
#5 re_tb=0;
we_tb=1;
addr_tb=0;
#5 we_tb=0;

re_tb=1;
addr_tb=8;
# 5re_tb=0;
we_tb=1;
addr_tb=1;
#5 we_tb=0;

fselect_tb=2'b01;
#5 fselect_tb=2'bzz;

re_tb=1;
addr_tb=2;
#5 re_tb=0;
we_tb=1;
addr_tb=11;
#5 we_tb=0;


//problem5
re_tb=1;
addr_tb=8;
#5 re_tb=0;
we_tb=1;
addr_tb=0;
#5 we_tb=0;

re_tb=1;
addr_tb=4;
# 5re_tb=0;
we_tb=1;
addr_tb=1;
#5 we_tb=0;

fselect_tb=2'b01;
#5 fselect_tb=2'bzz;

re_tb=1;
addr_tb=2;
#5 re_tb=0;
we_tb=1;
addr_tb=12;
#5 we_tb=0;

////problem 6
re_tb=1;
addr_tb=12;
#5 re_tb=0;

addr_tb=0;
we_tb=1;
#5 we_tb=0;

fselect_tb=2'b11;
#5 fselect_tb=2'bzz;
 
 re_tb=1;
addr_tb=2;
#5 re_tb=0;

addr_tb=12;
we_tb=1;
#5 we_tb=0;

//problem 7

addr_tb=6;
re_tb=1;
#5 re_tb=0;

addr_tb=5;
we_tb=1;
#5 we_tb=0;


fselect_tb=2'b10;
#5 fselect_tb=2'bzz;
 
 //problem8
 
re_tb=1;
 addr_tb=4;
 # 5re_tb=0;
we_tb=1;
 addr_tb=0;
 #5 we_tb=0;
 
 we_tb=1;
 addr_tb=1;
 #5 we_tb=0;
 
 fselect_tb=2'b01;
 #5 fselect_tb=2'bzz;

re_tb=1;
addr_tb=2;
#5 re_tb=0;
we_tb=1;
addr_tb=13;
#5 we_tb=0;

//problem9

din_tb=0;
le_tb=1;
#5 le_tb=0;

addr_tb=13;
we_tb=1;
#5 we_tb=0;

for (i=4;i<10;i=i+1)
begin
addr_tb=13;
re_tb=1;
#5re_tb=0;

addr_tb=0;
we_tb=1;
#5 we_tb=0;
 
addr_tb=i;
re_tb=1;
#5 re_tb=0;

addr_tb=1;
we_tb=1;
#5 we_tb=0;

 fselect_tb=2'b00;
 #5 fselect_tb=2'bzz;
 
 addr_tb=2;
 re_tb=1;
 #5 re_tb=0;
 
 addr_tb=13;
 we_tb=1;
 #5 we_tb=0;
 end


// problem 10

addr_tb=4;
re_tb=1;
#5 re_tb=0;

addr_tb=13;
we_tb=1;
#5 we_tb=0;

for (i=5;i<10;i=i+1)

begin
addr_tb=13;
re_tb=1;
#5re_tb=0;

addr_tb=4;
we_tb=1;
#5 we_tb=0;
 
addr_tb=i;
re_tb=1;
#5 re_tb=0;

addr_tb=5;
we_tb=1;
#5 we_tb=0;

fselect_tb=2'b10;
#5 fselect_tb=2'bzz;
 
addr_tb = (flag_register_tb[3])?4:5;

 re_tb=1;
 #5 re_tb=0;
 addr_tb=13;
 we_tb=1;
 #5 we_tb=0;
 end 
 

#10 
$finish;
end
endmodule
