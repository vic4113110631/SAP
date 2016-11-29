module Controller_TestBench();

 reg  CLK, CLR;
 reg  [3:0] opcode;
 wire [15:0]  con;

 Controller Unit(.con     (con[15:0]),
 	 	 .opcode  (opcode),
 		 .CLK	 (CLK),
		 .CLR	 (CLR)
 );

 always #10 CLK = ~CLK;
 always #15 opcode = opcode + 1;

 initial
   begin
        CLK = 0; CLR = 1; opcode = 0;
   #10  CLR = 0;
  
   #300 $finsh;
 end
endmodule