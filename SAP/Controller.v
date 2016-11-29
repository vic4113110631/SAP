module Controller(con, opcode, CLK, CLR);
 output con; 
 input  opcode, CLK, CLR;
 
 wire [3:0]  opcode;
 reg  [3:0]  ps, ns;
 reg  [11:0] con;
 
 always@(negedge CLK)
 begin
  if(CLR) ps <= 0;
  else    ps <= ns;
 end
 
 always@(opcode or ps)
 begin
  case(ps)
  0:begin con = 12'h3E3; ns = 1; end
  1:begin con = 12'h5E3; ns = 2; end //T1
  2:begin con = 12'hBE3; ns = 3; end //T2
  3:begin 
	  con = 12'h263;
	  if(opcode == 0)      begin ns = 4;  end//LDA
	  else if(opcode == 1) begin ns = 7;  end//ADD
          else if(opcode == 2) begin ns = 10; end//SUB
          else if(opcode == 14)begin ns = 13; end//OUT	 
          else if(opcode == 15)begin ns = 15; end//HLT
    end //T3
  //LDA
  4:begin con = 12'h1A3; ns = 5; end
  5:begin con = 12'h2C3; ns = 1; end
  6:begin con = 12'h3E3; ns = 1; end //idling cycle
  //ADD  
  7:begin con = 12'h1A3; ns = 8; end
  8:begin con = 12'h2E1; ns = 9; end
  9:begin con = 12'h3C7; ns = 1; end
  //SUB
  10:begin con = 12'h1A3; ns = 11; end
  11:begin con = 12'h2E1; ns = 12; end
  12:begin con = 12'h3CF; ns = 1; end
  //OUT
  13:begin con = 12'h3F2; ns = 1; end
  //HLT
  15:begin con = 12'h3E3; ns = 15; end 
  endcase
 end

endmodule
