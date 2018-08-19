`include "mux8.v"

module mux4(Y,X0,X1,X2,X3,S1,S2);

input X0,X1,X2,X3,S1,S2;
output Y;


mux8 mux8r(.Y(Y),.X0(X0),.X1(X1),.X2(X2),.X3(X3),.S1(0),.S2(S1),.S3(S2));

endmodule

