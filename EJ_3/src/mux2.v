//Tabla de verdad MUX
//input -> S0,X0,X1
//output->Y
//  S0    |   Y
//---------------
//  0     |   X0
//  1     |   X1

module mux2(Y,X0,X1,S0);

input X0,X1,S0;
output Y;
wire n , j , k;

and(j,S0,X1);
not(n,S0);
and(k,n,X0);
or(Y,j,k);



endmodule
