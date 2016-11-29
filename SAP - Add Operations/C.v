module C( C_Out, D, Lc_, ec, CLK);
 output C_Out;
 input  D, Lc_, ec, CLK;
 
 reg  [7:0] C_temp;
 
 wire [7:0] D, C_Out;
 wire Lc_, ec, CLK;
 
 always@(posedge CLK)
 begin
  if(~Lc_) C_temp <= D;
 end

 assign C_Out = ec ? C_temp : 8'bz;

 endmodule
