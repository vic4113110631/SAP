module MAR_TestBench();

reg 	   Lm_, CLK;
reg  [3:0] D;

wire [3:0] MAR_Out; 

MAR Unit(.MAR_Out (MAR_Out),
	 .Lm_	  (Lm_),
	 .D	  (D),
	 .CLK	  (CLK)
);

always #10 CLK = ~CLK;
always #15 D = D + 1;

initial
  begin
       CLK = 0; Lm_ = 1;  D = 0;
  #25  Lm_ = 0;

  #400 Lm_ = 1;
  #450 Lm_ = 0;
  #500 $finssh;
end
endmodule
