`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.11.2022 14:51:34
// Design Name: 
// Module Name: eucl
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


module eucl(instruction,le_pm,prog_counter);

input [27:0]instruction;
input le_pm;
output prog_counter;

reg  we_eucl,re_eucl,le_eucl;
wire [3:0]opcode;
wire [7:0]op1;
wire [7:0]op2;
wire [7:0]op3;
reg [4:0] addr_eucl;
reg [7:0] din_eucl;
reg [1:0] fselect_eucl;
reg [1:0] sselect_eucl;
wire [7:0] dbus_eucl;

wire [3:0] flag_register_eucl;
reg [4:0] prog_counter;

initial prog_counter = 0;

execution_unit eu(.we(we_eucl),.re(re_eucl),.le(le_eucl),.addr(addr_eucl),.din(din_eucl),.dbus(dbus_eucl),.fselect(fselect_eucl),.sselect(sselect_eucl),.flag_register(flag_register_eucl));
assign {opcode,op1,op2,op3}=instruction;

always@(instruction)
begin
   if(le_pm==0)
   begin
    case (opcode)
    
    //Load
    0: begin le_eucl = 1; din_eucl = op2; #0.1 le_eucl = 0; we_eucl = 1 ; addr_eucl = op1; #0.1 we_eucl=0;
    prog_counter=prog_counter+1;
     end
    
    //Add 01070605
    1: begin 
    re_eucl = 1; addr_eucl= op2; #0.1 re_eucl=0; we_eucl=1;addr_eucl=0; #0.1 we_eucl=0;
    #0.1
    re_eucl = 1; addr_eucl= op3; #0.1 re_eucl=0; we_eucl=1;addr_eucl=1; #0.1 we_eucl=0;
    #0.1
    fselect_eucl=2'b00 ; re_eucl=1 ; addr_eucl=2; #0.1 re_eucl=0;
    addr_eucl= op1; we_eucl=1; #0.1 we_eucl=0; 
    prog_counter=prog_counter+1;
    end
    
    //sub
    2: begin 
    re_eucl = 1; addr_eucl= op2; #0.1 re_eucl=0; we_eucl=1;addr_eucl=0; #0.1 we_eucl=0;
    #0.1
    re_eucl = 1; addr_eucl= op3; #0.1 re_eucl=0; we_eucl=1;addr_eucl=1; #0.1 we_eucl=0;
    #0.1
    fselect_eucl=2'b01 ; re_eucl=1 ; addr_eucl=2; #0.1 re_eucl=0;
    addr_eucl= op1; we_eucl=1; #0.1 we_eucl=0; 
    prog_counter=prog_counter+1;
    end
    
    //inc
    3:begin
    re_eucl=1 ; addr_eucl=op1 ; #0.1 re_eucl=0; we_eucl=1; addr_eucl=0;#0.1 we_eucl=0;
    #0.1
    fselect_eucl=2'b11; re_eucl=1 ; addr_eucl=2 ; #0.1 re_eucl=0;
    #0.1
    we_eucl=1 ; addr_eucl=op1 ;#0.1 we_eucl=0;
    prog_counter=prog_counter+1;
    end
    
    //cmp
    4:begin
    re_eucl = 1; addr_eucl= op2; #0.1 re_eucl=0; we_eucl=1;addr_eucl=4; #0.1 we_eucl=0 ;
    #0.1
    re_eucl = 1; addr_eucl= op3; #0.1 re_eucl=0; we_eucl=1;addr_eucl=5; #0.1 we_eucl=0 ;
    #0.1
    fselect_eucl=2'b10 ; we_eucl=1 ; addr_eucl=2; #0.1 we_eucl=0 ;
    prog_counter=prog_counter+1;
    end
    
    
    //mov
    5:begin
    re_eucl=1 ; addr_eucl=op1; #0.1 re_eucl=0;
    #0.1
    we_eucl=1; addr_eucl=op2; #0.1 we_eucl=0;
    prog_counter=prog_counter+1;
    end
    
    
    //jmp
    6:begin
    prog_counter=op1;
    end
    
    
    //
    endcase
    end
end
endmodule





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
// begin
// if(we && !re && !le)
// mem[addr]=dbus;
// if(re && !we &&!le)
// temp_dbus=mem[addr];
// if(le && !we &&!re)
// temp_dbus=din;
// end
 begin
 if(we)
 mem[addr]=dbus;
 if(re)
 temp_dbus=mem[addr];
 if(le)
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
      
endmodule