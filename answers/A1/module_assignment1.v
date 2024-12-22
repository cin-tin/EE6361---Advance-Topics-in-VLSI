`timescale 1ns / 1ps



module sam(we,re,addr,din,dout,dbus);

input  we,re;
input [3:0] addr;
input [7:0] din;
output [7:0] dout;
output [7:0] dbus;

 
 reg [7:0] single_ram[31:0];
 reg [7:0] dout;
 reg [7:0] dbus;
 always @(*)
// whenever input changes the loop gets executed

 begin 
   if( we==1) begin
   single_ram[addr]<=din;
  
  
   end
   else if (re==1) begin
   dout <= single_ram[addr];
  
   end
  
   assign dbus=(we==1)?din:dout;
   
 end
   



endmodule