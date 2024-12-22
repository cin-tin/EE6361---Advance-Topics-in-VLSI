timescale 1ns / 1ps

module testb();
reg we_tb,re_tb;
reg [7:0] din_tb;
reg [3:0] addr_tb;
wire [7:0] dout_tb;
wire [7:0] dbus_tb;

initial begin 

we_tb=0;
addr_tb=0;
din_tb=0;
re_tb=0;
#5

//writing a value to the register R2

addr_tb = 4'b0001;
din_tb = 8'b00101111;
we_tb=1;


#50
//reading from the selected register
addr_tb = 4'b0001;
we_tb=0;
re_tb=1;

#100
//moving contents from R2 to R4
addr_tb=1;
re_tb=1;
we_tb=0;

#50
addr_tb=4'b0011;
din_tb = dbus_tb;
we_tb=1;
re_tb=0;

end
 
 
sam r(.re(re_tb),.we(we_tb),.din(din_tb),.dout(dout_tb),.addr(addr_tb),.dbus(dbus_tb));
endmodule
