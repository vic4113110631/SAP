module IR_TestBench();

reg        CLK, CLR, Li_, ei_;
reg  [7:0] D;

wire [3:0] opcode, operand;

IR Unit(.CLK     (CLK),
        .CLR     (CLR),
        .opcode  (opcode),
        .operand (operand),
        .D       (D),
        .Li_     (Li_),
        .ei_     (ei_)
);

always #10 CLK = ~CLK;

initial
  begin
       CLK = 0; CLR = 1; D = 0; Li_ = 1; ei_ = 1;
  #10  Li_ = 0; ei_ = 0; CLR = 0;
  #20  D = 8'h09;  //LDA 9H == 09
  #30  D = 8'h1A;  //ADD AH == 1A
  #40  D = 8'h1B;  //ADD BH == 1B
  
  #50  Li_ = 1; ei_ = 1;

  #60  D = 8'h2C;  //SUB CH == 2C
  #70  D = 8'hEX;  //OUT 3X
  #80  D = 8'hFX;  //HLT 4X
  
  #90  Li_ = 0; ei_ = 0; 

  #100  D = 8'h2C;  //SUB CH == 2C
  #110  D = 8'hEX;  //OUT 3X
  #120  D = 8'hFX;  //HLT 4X
  #130  $finsh;
end
endmodule
