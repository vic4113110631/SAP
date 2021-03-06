module IR(CLK, CLR, opcode, operand, D, Li_, ei_);
 input  D;
 input  CLK, CLR, Li_, ei_;
 output opcode;
 output operand;
 
 wire Li_, ei_;
 wire [7:0] D;
 wire [3:0] opcode, operand;

 reg  [7:0] Q;
 
 always@(posedge CLK)
 begin
  if(CLR)       Q <= 0;
  else if(~Li_) Q <= D;
 end

 assign opcode  = Q[7:4];
 assign operand = ei_ ? 4'bz : Q[3:0];

 endmodule