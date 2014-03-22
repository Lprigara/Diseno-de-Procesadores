module regM(input wire clk, ResetM, CargaM, input wire [3:0] entM, output wire [3:0] m);
	//Registro M de 4 bits, soporta Carga de entM y reseteo

	ffdc ffm0(clk, ResetM, CargaM, entM[0], m[0]);
	ffdc ffm1(clk, ResetM, CargaM, entM[1], m[1]);
	ffdc ffm2(clk, ResetM, CargaM, entM[2], m[2]);
	ffdc ffm3(clk, ResetM, CargaM, entM[3], m[3]);

endmodule
