module ca2(input wire [3:0] M, input wire resta, output wire [3:0] B, output wire cin);
	//modulo de complemento a 2 para M 
	//depende de la señal resta que puede ser 1 o 0
	//si es 1 se hace el ca2 si es cero se usa M 
	assign cin = resta ? 1'b1 : 1'b0;

	assign B[0] = M[0] ^ resta; //XOR 
	assign B[1] = M[1] ^ resta;
	assign B[2] = M[2] ^ resta;
	assign B[3] = M[3] ^ resta;

endmodule
