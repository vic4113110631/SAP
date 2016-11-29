module ALU_TestBench();

reg        eu;
reg  [1:0] su;
reg  [7:0] A_in, B_in;

wire [7:0] ALU_Out;

ALU Unit(.ALU_Out  (ALU_Out),
	 .A_in      (A_in),
	 .B_in      (B_in),
	 .su	    (su),
	 .eu	    (eu)
);

always #10 A_in = A_in + 1; 
always #15 B_in = B_in + 1;

initial
  begin
       A_in = 0; B_in = 0; su = 0; eu = 0;
  #10  eu = 1;
  #100 eu = 0;
  #150 eu = 1; su = 1;
  #200 su = 2;
  #250 su = 3;
  #400 $finsh; 
end

endmodule