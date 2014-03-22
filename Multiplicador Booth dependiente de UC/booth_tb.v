`timescale 1 ns / 10 ps

`include "ffdc.v"
`include "regA.v"
`include "regQ.v"
`include "regM.v"
`include "sum4.v"
`include "uc.v"
`include "ca2.v"
`include "booth.v"

module booth_tb;

	reg [3:0] initQ, initM;
	reg start, clk; 
	
	wire [7:0] resultado; 
	wire fin;
	
	always begin
	  clk = 1;
	  #20
	  clk = 0;
	  #60
	  
	  if(fin)begin
		$finish;
	   end
	end

	//valores iniciales
	initial begin
		$dumpfile ("booth_tb.vcd"); 
		$dumpvars;
		$monitor ("time=%0d, clk=%b, Start=%b,  Fin=%b, Resultado=%b", $time, clk, start, fin, resultado);
		
		initQ = 4'b1001;
		initM = 4'b0101;
		$display ("Valores: Q=%b, M=%b", initQ, initM);
		
		start = 0;
		#2
		start = 1;
		#1
		start = 0;
		
	end
	
	booth booth1(initQ, initM, start, clk, resultado, fin);

endmodule
