module booth(input wire [3:0] initQ, initM, input wire start, clk, output wire [7:0] resultado, output wire fin);

	wire ResetA, CargaA, DesplazaA, CargaQ, DesplazaQ, CargaM, Resta, cin;
	wire [3:0] SalA, SalQ, SalM, B, SalS;
	wire SalQ_1;
	
	assign resultado = {SalA, SalQ}; 
	
	regQ Q (initQ, SalA[0], CargaQ, DesplazaQ, clk, 1'b0, SalQ, SalQ_1);
	regA A (SalS, CargaA, DesplazaA, clk, ResetA, SalA);
	regM M (clk, 1'b0, CargaM, initM, SalM);
	sum4 sum (SalS, , , SalA, B, cin);
	ca2 C (SalM, Resta, B, cin);
	uc uc0 (SalQ[0], SalQ_1, start, clk, CargaA, DesplazaA, ResetA, CargaQ, DesplazaQ, CargaM, Resta, fin);

endmodule
