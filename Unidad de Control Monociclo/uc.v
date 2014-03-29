module uc(input wire clk, reset, z, input wire [5:0] opcode, output reg s_inc, s_inm, we3, output wire [2:0] op);

assign op = opcode[2:0];

always @(*)

  if (reset == 1'b1)
  begin
  $display ("RESET");
    we3 <= 1'b0;		//no permite escribir registro
    s_inm <= 1'b0;		//no constante inmediata	  
    s_inc <= 1'b1;		//stay
  end
  
  else
  begin
    casex (opcode)
	
	//ALU
	6'bxx0xxx:
	  begin
	    $display ("Op. ALU");
	    we3 <= 1'b1;		//permite escribir registro
	    $display("op=%b", op);
	    s_inc <= 1'b1;		//pc+1
	    s_inm <= 1'b0;		//no constante inmediata
	  end
	  
	//CARGA
	6'bxx1000:
	  begin
	  $display ("Op. CARGA");
	    we3 <= 1'b1;		//permite escribir registro
	    s_inc <= 1'b1;		//pc+1
	    s_inm <= 1'b1;		//constante inmediata
	  end
	  
	//SALTO ABSOLUTO
	6'b101001:
	  begin
	  $display ("Op. SALTO");
	    we3 <= 1'b0;		//no permite escribir registro
	    s_inc <= 1'b0;		//salto
	    s_inm <= 1'b0;		//no constante inmediata
	  end
	  
	//SALTO CONDICIONAL
	6'b101010:
	  begin
	  $display ("Op. SALTO CONDICIONAL");
	    we3 <= 1'b0;		//no permite escribir registro
	    s_inm <= 1'b0;		//no constante inmediata	  
	    if(z == 1'b1)
	      s_inc <= 1'b0;		//salto
	    else
	      s_inc <= 1'b1;		//pc+1
	  end
	  
	//DEFECTO
	default:
	  begin
	    we3 <= 1'b0;		//no permite escribir registro
	    s_inm <= 1'b0;		//no constante inmediata	  
	    s_inc <= 1'b1;		//pc+1
	  end

    endcase
  end	
endmodule
