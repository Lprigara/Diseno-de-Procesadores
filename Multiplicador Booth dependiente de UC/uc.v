module uc(input wire q0, q_1, start, clk, output wire CargaA, DesplazaA, ResetA, CargaQ, DesplazaQ, CargaM, Resta, Fin);

	
	reg [1:0] state, nextstate;
	reg [1:0] n;
	
	parameter S0 = 2'b00; //inicial
	parameter S1 = 2'b01; //sumar/restar
	parameter S2 = 2'b10; //desplazar
	parameter S3 = 2'b11; //fin
	

	always @ (posedge clk, posedge start) begin
		if (start) begin
			state <= S0;
			n <= 2'b00;
		end else begin
			state <= nextstate;
			if (state == S2) begin
				n <= n + 2'b01;
			end
		end
	end
		
	always @(*) 
	case (state)
		S0: nextstate = S1;
		S1: nextstate = S2;
		S2: nextstate = (n == 2'b11) ? S3 : S1;
		S3: nextstate = S3;
		default: nextstate = S0;
	endcase
	
	assign CargaA = (state == S1) && (q0 != q_1);
	assign DesplazaA = (state == S2) ? 1 : 0;
	assign ResetA = (state == S0) ? 1 : 0;
	assign CargaQ = (state == S0) ? 1 : 0;
	assign DesplazaQ = (state == S2) ? 1 : 0;
	assign CargaM = (state == S0) ? 1 : 0;
	assign Resta = (state == S1) && (q0 == 1 && q_1 == 0);
	assign Fin = (state == S3) ? 1 : 0;

endmodule
