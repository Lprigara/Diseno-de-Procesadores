module regQ (input wire [3:0] entQ, input wire a0, CargaQ, DesplazaQ, clk, reset, output wire [3:0] q, output wire q_1);

	assign enable = CargaQ | DesplazaQ; //Si se carga o desplaza se habilitan en modificación los biestables
	
	assign entQ3 = CargaQ ? entQ[3] : a0; //eligir q para inicializacion o a0 para desplazamiento
	
	
	cdaff ffq_1(CargaQ, 1'b0, q[0], clk, reset, enable, q_1);//q-1
	cdaff ffq0(CargaQ, entQ[0], q[1], clk, reset, enable, q[0]);//q0
	cdaff ffq1(CargaQ, entQ[1], q[2], clk, reset, enable, q[1]);//q1
	cdaff ffq2(CargaQ, entQ[2], q[3], clk, reset, enable, q[2]);//q2
	cdaff ffq3(CargaQ, entQ[3], entQ3, clk, reset, enable, q[3]); //q3 entra o el valor de q inicial o el valor menos significado del regA

endmodule

//Biestable con entrada de mux para aceptar dos entradas posibles
module cdaff (input wire selc_d, inp_c, inp_d, clk, reset, carga, output wire q);

	wire inp;
	ffdc ff0(clk, reset, carga, inp, q);
	mux2_1_i1 mux0(inp, inp_d, inp_c, selc_d);
	
endmodule

//Mux de dos entradas de 1 bit realizado a partir de puertas 
module mux2_1_i1(output wire out, input wire a, b, s);

	//Declaración de conexiones internas
	wire  s_n, sa, sb;	   
	//Instancias de puertas y sus conexiones
	not inv1 (s_n, s); // !s
	and and1 (sa, a, s_n); // !s ^ a
	and and2 (sb, b, s); // !s ^ b
	or or1 (out, sa, sb); // (!s ^ a) v (!s ^ b)

endmodule
