`include "mux2.v"

//Tabla de verdad MUX
//input -> S0,S1,X0 a X3
//output->Y
//  S0  S1  |   Y
//--------------------
//  0   0   |   X0
//  0   1   |   X1
//  1   0   |   X2
//  1   1   |   X3

module mux4(Y,X0,X1,X2,X3,S0,S1);

input X0,X1,X2,X3,S0,S1;
output Y;

wire Y1,Y2;

mux2 mux_1(Y1,X0,X1,S1);//
mux2 mux_2(Y2,X2,X3,S1);//cuyos pines de seleccion estan conectados juntos

mux2 mux_3(Y,Y1,Y2,S0); //selector de mux

endmodule