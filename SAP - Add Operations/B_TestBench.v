module B_TestBench();

 reg       CLK, Lb_, eb;
 reg [7:0] D;

 wire [7:0] B_OutToBus, B_OutToALU;

 B Unit(.CLK         (CLK),
        .B_OutToBus  (A_OutToBus),
        .B_OutToALU  (A_OutToALU),
        .D           (D),
        .Lb_         (Lb_),
        .eb          (eb)
 );

 always #10 CLK = ~CLK;
 always #15 D = D + 1;

 initial
   begin
        CLK = 0; Lb_ = 1; eb = 0; D = 0;
   #10  Lb_ = 0; eb = 1;
  
  #200 Lb_ = 1;
  #250 eb  = 0;
  #350 Lb_ = 0;
  #400 eb  = 1;
  #500 $finssh;
 end

endmodule
