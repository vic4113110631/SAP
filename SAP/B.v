module B( B_Out, D, Lb_, CLK);
 output B_Out;
 input D, Lb_, CLK;
 
 reg  [7:0] B_Out;
 
 wire [7:0] D;
 wire Lb_, CLK;
 
 always@(posedge CLK)
 begin
  if(~Lb_) B_Out <= D;
 end

 endmodule
