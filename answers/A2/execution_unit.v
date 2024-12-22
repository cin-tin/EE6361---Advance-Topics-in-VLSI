`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2022 10:22:40
// Design Name: 
// Module Name: execution_unit
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


module execution_unit(we,re,le,addr,din,dbus,fselect,sselect,flag_register);
input  we,re,le;
input [4:0] addr;
input [7:0] din;
input [1:0] fselect;
input [1:0] sselect;
output [7:0] dbus;

output [3:0] flag_register;

 
 reg [7:0] mem[31:0];
 reg [7:0] dout;
 reg [7:0] temp_dbus;
 wire [7:0] sresult;
 reg so;
 reg [7:0] temp,sinp,fr;
 wire [3:0] flag_register;
 reg carry_borrow,zero,cmp;
 reg [8:0] alu_out;
 wire [7:0] dbus;
 
 assign dbus=temp_dbus;
 //load
 always@(*)
 begin
 if(we && !re && !le)
 mem[addr]=dbus;
 if(re && !we &&!le)
 temp_dbus=mem[addr];
 if(le && !we &&!re)
 temp_dbus=din;
 end
 
 
 //flag register {cmp,zero,so,carry_borrow}
//assign flag_register=(fselect==2'b00)?{1'bz,1'bz,1'bz,carry_borrow}:{1'bz,1'bz,1'bz,1'bz};
//assign flag_register=(fselect==2'b01)?{1'bz,zero,1'bz,carry_borrow}:{1'bz,1'bz,1'bz,1'bz};
//assign flag_register=(fselect==2'b10)?{cmp,1'bz,1'bz,1'bz}:{1'bz,1'bz,1'bz,1'bz};
//assign flag_register=(!sselect || sselect)?{1'bz,1'bz,so,1'bz}:{1'bz,1'bz,1'bz,1'bz};
assign flag_register=fr;
 
always @(*) begin

if (fselect==2'b00) fr = {1'bz,1'bz,1'bz,carry_borrow};
if (fselect==2'b01) fr = {1'bz,1'bz,1'bz,carry_borrow};
if (fselect==2'b10) fr = {cmp,1'bz,1'bz,1'bz};
if (!sselect || sselect) fr = {1'bz,1'bz,so,1'bz};
if ((fselect==2'bzz)&&(sselect==1'bz)) fr = {1'bz,1'bz,1'bz,1'bz};

end
 
 
always @(*) begin sinp = mem[0]; fr[2]=zero;end
 
  //shiftregister
 always@(*)
 begin
    case(sselect)
    1'b0:
    begin
    temp[7:1]=sinp[6:0];
    temp[0]= 1'b0;
    so=sinp[7];
    mem[3]=temp;
    end
    1'b1:
    begin
    temp[6:0]=sinp[7:1];
    temp[7]=1'b0;
    so=sinp[0];
    mem[3]=temp;
    end
    
    endcase
  
 end
 
 
 
 //ALU operation
 
 always @(*)
 begin
    case(fselect)
      2'b00: 
      begin
      alu_out=mem[0]+mem[1];
      mem[2]=alu_out[7:0];
      carry_borrow=alu_out[8];
      end
      2'b01:
      begin
      if 
     (mem[0]>mem[1])
     begin
      mem[2]=mem[0]-mem[1];
      carry_borrow=0;
      end
      else
      begin 
      mem[2]=mem[1]-mem[0];
      carry_borrow=(!mem[2])?0:1;
      zero=(mem[2]==0)?1:0;
      end
      end
      2'b10:
      cmp=(mem[4]>=mem[5])?1:0;
      2'b11:
      mem[2]=mem[0]+1;
      endcase
      end
      

 
 
      
// always @(*)
//// whenever input changes the loop gets executed

// begin 
//   if( we==1) begin
//   mem[addr]<=din;
  
  
//   end
//   else if (re==1) begin
//   dout <= mem[addr];
  
//   end
  
//   assign dbus=(we==1)?din:dout;
   
// end

endmodule
