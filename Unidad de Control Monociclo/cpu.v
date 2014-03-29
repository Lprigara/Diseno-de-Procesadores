/*module cpu(input wire reset, clk, output wire s_inc, s_inm, we3, z, output wire [2:0] op, output wire [5:0]opcode);

  microc micro1(clk, reset, s_inc, s_inm, we3, op, z, opcode);
  uc uc1(clk, reset, z, opcode, s_inc, s_inm, we3, op);

endmodule*/

module cpu(input wire clk, reset);

  wire s_inc, s_inm, we3, z;
  wire [2:0] op;
  wire [5:0] opcode;
  
  microc micro1(clk, reset, s_inc, s_inm, we3, op, z, opcode);
  uc uc1(clk, reset, z, opcode, s_inc, s_inm, we3, op);
  
endmodule