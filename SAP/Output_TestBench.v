module Output_TestBench();

reg        CLK, Lo_;
reg  [7:0] D;

wire [7:0] LED;

Output Unit(.Out   (LED),
 	    .D     (D),
	    .Lo_   (Lo_),
            .CLK   (CLK)
);

always #10 CLK = ~CLK;
always #15 D = D + 1;

initial
  begin
       CLK = 0; Lo_ = 1; D = 0;
  #10  Lo_ = 0;
  
  #200 Lo_ = 1;
  #350 Lo_ = 0;
  #500 $finssh;
end
endmodule
