module SAP_TestBench();

wire [7:0] Bus;

reg       CLK;
reg	  CLR;

SAP Unit(.Bus  (Bus[7:0]),
 	 .CLK  (CLK),
  	 .CLR  (CLR)
);

always #10 CLK = ~CLK;

initial
  begin
       CLK = 0; CLR = 1;
  #10  CLK = 0;
  #20  CLR = 0;
  #300 $finsh;
end

endmodule
