//Microcontrolador sin memoria de datos de un solo ciclo
module microc(input wire clk, reset, s_inc, s_inm, we3, input wire [2:0] op, output wire zero, output wire [5:0] opcode);

wire [9:0] pc_out, mux_pc; //cable sumador, pc y memprog; cable mux_inc y pc
wire [9:0] sum_mux;
wire [7:0] alu_mux, mux_reg;
wire [7:0] rd1_alu, rd2_alu; //entradas a y b de la ALU
wire [15:0] bus_datos;
wire z;

sum sum_pc(pc_out, 1'b1, sum_mux);	//a,1→in	sum_mux→out

registro #(10) pc(clk, reset, mux_pc, pc_out);	//clk,reset,mux_pc→in	pc_out→out
               
memprog mem_instr(clk, pc_out, bus_datos[15:0]);           
                             
mux2 #(10) mux_inc(bus_datos[15:6], sum_mux, s_inc, mux_pc); //modulo multiplexor, con s=1 sale sum_mux, s=0 sale d0            
             
regfile registros(clk, we3, bus_datos[7:4], bus_datos[11:8], bus_datos[15:12], mux_reg, rd1_alu, rd2_alu);               
              
alu alu1(rd1_alu, rd2_alu, op, alu_mux, z); 
           
mux2 mux_inm(alu_mux, bus_datos[11:4], s_inm, mux_reg);

registro #(1) ffzero(clk, reset, z, zero);	//clk,reset,mux_pc→in	pc_out→out

assign opcode = bus_datos[5:0];

endmodule
