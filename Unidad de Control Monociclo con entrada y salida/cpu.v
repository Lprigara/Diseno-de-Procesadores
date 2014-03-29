module cpu(input wire clk, reset, input wire [7:0]d0_e,d1_e,d2_e,d3_e, output wire [7:0]d0_s,d1_s,d2_s,d3_s);

  wire s_inc, s_inm,s_e,s_s,s_mem_rd2, we3, z;
  wire [2:0] op;
  wire [5:0] opcode;
  
  microc micro1(clk, reset, s_inc, s_inm, we3, s_mem_rd2, s_e, s_s,
	d0_e,d1_e,d2_e,d3_e,
	op, zero,
	d0_s,d1_s,d2_s,d3_s,
	opcode);
  uc uc1(clk, reset, z, opcode, s_inc, s_inm, s_e, s_s, s_mem_rd2, we3, op);
   
endmodule
