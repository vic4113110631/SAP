module B( B_OutToBus, B_OutToALU, D, Lb_, eb, CLK);
 output B_OutToBus, B_OutToALU;
 input  D, Lb_, eb, CLK;
 
 reg  [7:0] B_OutToALU;
 wire [7:0] D, B_OutToBus;
 wire Lb_, eb, CLK;
 
 always@(posedge CLK)
 begin
  if(~Lb_) B_OutToALU <= D;
 end
 
 assign B_OutToBus = eb ? B_OutToALU : 8'bZ;
 
 endmodule
