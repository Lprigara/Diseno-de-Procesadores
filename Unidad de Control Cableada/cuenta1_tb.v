`timescale 1 ns / 10 ps //Directiva que fija la unidad de tiempo de simulacion y el paso de simulacion

`include "ffdc.v"
`include "regA.v"
`include "regQ.v"
`include "sum4.v"
`include "cuenta1.v"
`include "uc_cableada.v"

module cuenta1_tb;

  reg [2:0] valor;
  reg start, clk;
  wire [3:0] cuenta;
  wire fin;

  cuenta1 c1(valor, start, clk, cuenta, fin);//Instancia modulos uc cableada.

  // generación de reloj clk
  always //siempre activo, no hay condición de activación
  begin
    clk = 0;
    #20;
    clk = 1;
    #20;
    
    if(fin)
      $finish;
  end

  initial
  begin
    $monitor("tiempo=%0d Valor=%b start=%b clk=%b Cuenta=%0d fin=%b", $time, valor, start, clk, cuenta, fin);
    $dumpfile("cuenta1_tb.vcd");
    $dumpvars;


    start = 1'b1;
    #10;
    start = 1'b0;
    #10;
    
    valor = 3'b111;
    #500;

  end

endmodule