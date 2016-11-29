/*
su  
0   +
1   -
*/
module ALU( ALU_Out, A_in, B_in, su, eu);
 output ALU_Out;
 input A_in, B_in, su, eu;
 
 wire [7:0] ALU_Out;
 wire [7:0] A_in, B_in;
 wire su, eu;
 
 reg       CarryOut;
 reg [6:0] Sum;
 
 always@(A_in or B_in or su)
 begin
   case(su)
     3'b000: {CarryOut, Sum} <= A_in + B_in;
     3'b001: {CarryOut, Sum} <= A_in - B_in;
   endcase
 end

 assign ALU_Out = eu ? {CarryOut, Sum} : 8'bz;

 endmodule
