module A_TestBench();

reg       CLK, La_, ea;
reg [7:0] D;

wire [7:0] A_OutToBus, A_OutToALU;

A Unit(.CLK         (CLK),
       .A_OutToBus  (A_OutToBus),
       .A_OutToALU  (A_OutToALU),
       .D           (D),
       .La_         (La_),
       .ea          (ea)
);

always #10 CLK = ~CLK;
always #15 D = D + 1;

initial
  begin
       CLK = 0; La_ = 1; ea = 0; D = 0;
  #10  La_ = 0; ea = 1;
  
  #200 La_ = 1;
  #250 ea  = 0;
  #350 La_ = 0;
  #400 ea  = 1;
  #500 $finssh;
end
endmodule