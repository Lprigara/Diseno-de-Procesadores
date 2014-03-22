module uc_cableada(input wire q0, start, clk, output wire CargaQ, DesplazaQ, ResetA, CargaA, Fin);
   wire[7:0] out_dec; //salida del decodificador
   
   dec dec1(clk, start, out_dec);
   
   assign CargaQ = out_dec[0];
   assign DesplazaQ = (out_dec[2] | out_dec[4]);
   assign ResetA = out_dec[0];
   assign CargaA = (q0 & (out_dec[1] | out_dec[3] | out_dec[5]));
   assign Fin = out_dec[6];
   
endmodule

module dec(input wire clk, start, output reg[7:0] out_dec);
      
    reg[2:0] in_dec;
    
    always @(posedge clk, posedge start)
    begin
      if(start) 
	in_dec <= 3'b000;
      else
	in_dec <= in_dec + 1;
	   
      case(in_dec)
	3'd0: out_dec <= 8'b00000001;
	3'd1: out_dec <= 8'b00000010;
	3'd2: out_dec <= 8'b00000100;
	3'd3: out_dec <= 8'b00001000;
	3'd4: out_dec <= 8'b00010000;
	3'd5: out_dec <= 8'b00100000;
	3'd6: out_dec <= 8'b01000000;
	
      endcase
    end
endmodule
