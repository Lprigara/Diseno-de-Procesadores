`timescale 1 ns / 10 ps

`include "alu.v"
`include "componentes.v"
`include "cpu.v"
`include "memprog.v"
`include "microc.v"
`include "uc.v"

module cpu_tb;

reg reset, clk;	
reg [7:0] d0_e, d1_e, d2_e, d3_e;
wire [7:0] d0_s, d1_s, d2_s, d3_s;

always begin
	clk = 1;
	#20;
	clk = 0;
	#60;
end

initial begin

      $monitor ("time=%0d, clk=%b, Reset=%b, d0_s=%d, d1_s=%d, d2_s=%d, d3_s=%d", $time, clk, reset, d0_s, d1_s, d2_s, d3_s);
	  
      $dumpfile ("cpu_tb.vcd"); 
      $dumpvars;
	  
	  d0_e = 8'b00000000; //0
	  d1_e = 8'b00001000; //8
	  d2_e = 8'b00000101; //5
	  d3_e = 8'b10000000; //128
	  
	  $display ("Entradas: d0_e=%d, d1_e=%d, d2_e=%d, d3_e=%d", d0_e, d1_e, d2_e, d3_e);
	  
      reset = 1;
      #5
      reset = 0;
      #5000
	  
  $finish;
  
end

cpu cpu1(clk, reset, d0_e, d1_e, d2_e, d3_e, d0_s, d1_s, d2_s, d3_s);

endmodule

