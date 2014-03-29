`timescale 1 ns /10 ps

`include "alu.v"
`include "microc.v"
`include "componentes.v"
`include "memprog.v"
`include "uc.v"

`include "cpu.v"
module cpu_tb;

reg start, clk;
//wire [2:0] op;
//wire [5:0] opcode;
//wire s_inc, s_inm, we3, z;


always begin
	clk = 1;
	#20;
	clk = 0;
	#60;
end

initial begin
      //$monitor ("time=%0d, clk=%b, Start=%b, s_inc=%b, s_inm=%b, we3=%b, z=%b, op=%b, opcode=%b", $time, clk, start, s_inc, s_inm, we3, z, op, opcode);
      $monitor ("time=%0d, clk=%b, Start=%b", $time, clk, start);
      $dumpfile ("cpu_tb.vcd"); 
      $dumpvars;
      
		
      start = 1;
      #5
      start = 0;
      #5000
  $finish;
end
/*
cpu cpu1(clk, start, s_inc, s_inm, we3, z, op, opcode);
*/
cpu cpu1(clk, start);

endmodule

