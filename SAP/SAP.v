module SAP(Bus, CLK, CLR);
 output Bus;
 input  CLK, CLR;
 
 wire        CLK, CLR;
 wire [11:0] con;
 wire [7:0]  Bus, A_OutToALU, B_Out, LED;
 wire [3:0]  MAR_Out, IR_Opcode;

 
 wire   CP, EP, Lm_, CE_, Li_, ei_, La_, ea, Su, Eu, Lb_, Lo_;
 
 assign {CP,  EP,  Lm_, CE_, 
	 Li_, ei_, La_, ea,
	 Su,  Eu,  Lb_, Lo_ } = con; //4 bit signals as a group
 
 PC  PC_unit(.PC_Out (Bus[3:0]),
	     .CLK    (CLK),
             .CP     (CP),
             .EP     (EP),
             .CLR    (CLR)
             );

 MAR MAR_unit(.MAR_Out (MAR_Out[3:0]),
              .Lm_     (Lm_),
              .D       (Bus[3:0]),
              .CLK     (CLK)
              );
 
 ROM ROM_unit(.ROM_Out (Bus[7:0]),
              .address (MAR_Out[3:0]), 
              .CE_     (CE_)
              );

 IR  IR_unit(.CLK     (CLK),
             .CLR     (CLR), 
             .opcode  (IR_Opcode),
             .operand (Bus[3:0]),
             .D       (Bus[7:0]), 
             .Li_     (Li_),
             .ei_     (ei_) 
 	     );

 Controller Controller_unit(.con    (con),
			    .opcode (IR_Opcode),
 			    .CLK    (CLK),
			    .CLR    (CLR)
			    );

 A   A_unit(.CLK    (CLK),
 	    .A_OutToBus  (Bus),
            .A_OutToALU  (A_OutToALU),
	    .D      (Bus),
	    .La_    (La_),
	    .ea     (ea)
	    );

 ALU ALU_unit(.ALU_Out (Bus),
 	      .A_in    (A_OutToALU),
   	      .B_in    (B_Out),
 	      .su      (Su),
 	      .eu      (Eu)
 	      );

 B   B_unit(.B_Out (B_Out),
	    .D     (Bus),
	    .Lb_   (Lb_),
	    .CLK   (CLK)
	    );

 Output Output_unit(.Out (LED[7:0]),
	  	    .D   (Bus),
		    .Lo_ (Lo_),
		    .CLK (CLK)
	            );

endmodule