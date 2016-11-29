module ROM(ROM_Out, address, CE_);
 output ROM_Out;
 input  address;
 input  CE_;
 
 wire CE_;
 wire [3:0] address;
 wire [7:0] ROM_Out; 
 reg  [7:0] Data;
 
 always @(address)
 begin
  case(address)
  5'h0: Data = 8'h09; //LDA  9H == 09
  5'h1: Data = 8'h1A; //ADD  AH == 1A
  5'h2: Data = 8'h1B; //ADD  BH == 1B
  5'h3: Data = 8'h2C; //SUB  CH == 2C
  5'h4: Data = 8'h3D; //AND  DH == 3D 
  5'h5: Data = 8'h4E; //OR   EH == 4E
  5'h6: Data = 8'h5X; //SWAP XH == 5X
  5'h7: Data = 8'hEX; //OUT  XH == EX
  5'h8: Data = 8'hFX; //HLT  XH == FX
  5'h9: Data = 8'h10; 
  5'hA: Data = 8'h14;
  5'hB: Data = 8'h18;
  5'hC: Data = 8'h20;
  5'hD: Data = 8'hFF;
  5'hE: Data = 8'h07;
  5'hF: Data = 8'hF7;  
  default Data = 8'h00;
  endcase
 end
 
 assign ROM_Out = CE_ ? 8'bZ : Data;

endmodule
