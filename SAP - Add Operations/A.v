module A(CLK, A_OutToBus, A_OutToALU, D, La_, ea);
 
 output A_OutToBus, A_OutToALU;
 input  D, La_, ea, CLK;
 
 reg  [7:0] A_OutToALU;
 wire [7:0] D, A_OutToBus;
 wire CLK, La_, ea;

 always@(posedge CLK)
 begin
  if(~La_) A_OutToALU <= D;
 end

 assign A_OutToBus = ea ? A_OutToALU : 8'bZ;

endmodule