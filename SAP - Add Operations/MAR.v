module MAR( MAR_Out, Lm_, D, CLK);
 output [3:0] MAR_Out;
 input  [3:0] D;
 input  Lm_, CLK;

 reg  [3:0] MAR_Out;
 wire [3:0] D;

 always@(posedge CLK)
 begin
  if(~Lm_)MAR_Out <= D;
 end

endmodule
