module PC( PC_Out, CLK, CP, EP, CLR);
 output [3:0] PC_Out;
 input  CP, CLK, EP, CLR;
 
 reg    [3:0] Q;

 always@(posedge CLK)
 begin
  if(CLR == 1) Q <= 0;
  else if(CP)  Q <= Q + 1;  
 end
 
 assign PC_Out = EP ? Q : 4'bz;

endmodule
