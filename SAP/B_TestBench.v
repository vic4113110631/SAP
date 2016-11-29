module B_TestBench();

reg        CLK, Lb_;
reg  [7:0] D;

wire [7:0] B_Out;

B Unit(.B_Out  (B_Out),
       .D      (D),
       .Lb_    (Lb_),
       .CLK    (CLK)
);

always #10 CLK = ~CLK;
always #15 D = D + 1;

initial
  begin
       CLK = 0; D = 0; Lb_ = 1;
  #10  Lb_ = 0;
  #100 Lb_ = 1;
  #150 Lb_ = 0;
  #200 $finsh;
end
endmodule
