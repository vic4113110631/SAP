module Output(Out, D, Lo_, CLK);
 output Out;
 input  D, Lo_, CLK;

 reg  [7:0] Out;
 wire [7:0] D;
 wire Lo_, CLK;

 always@(posedge CLK)
 begin
  if(~Lo_) Out <= D;
 end
endmodule

