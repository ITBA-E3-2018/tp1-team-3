`include "sum.v"
module tstsum;
reg dummy;
//module mux8(Y,X0,X1,X2,X3,X4,X5,X6,X7,S1,S2,S3);

wire [3:0] R, CCR;    
input[3:0] A,B;

//reg a,b,c,b0,b1,b2,b3, b4,b5,b6,b7;
//wire Y;

sum tst_sum(R, CCR, A, B);
initial begin
dummy = $value$plusargs("A=%d", A);
dummy = $value$plusargs("B=%d", B);
#1
$display("A+B=%d",R);

$finish;
end

endmodule