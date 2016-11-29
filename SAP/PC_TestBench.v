module PC_TestBench ();

reg CLK, CP, EP, CLR;

wire [3:0] PC_Out;

PC Unit(.PC_Out (PC_Out),
	.CLK	(CLK),
	.CP	(CP),
	.EP	(EP),
	.CLR	(CLR)
);

always #10 CLK = ~CLK;

initial
  begin
       CLK = 0; CLR = 1; CP = 1; EP = 1;
  #25  CLR = 0;
  
  #400 CP = 0;
  #500 CP = 1;
  #550 EP = 0;
end
endmodule
