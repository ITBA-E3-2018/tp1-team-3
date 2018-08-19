`include "mux4.v"
module environmentMux4;
reg dummy;
//module mux8(Y,X0,X1,X2,X3,X4,X5,X6,X7,S1,S2,S3);
reg a,b,b0,b1,b2,b3;
wire Y;
mux4 mux4t(Y,b0,b1,b2,b3,a,b);
initial begin
dummy = $value$plusargs("a=%b", a);
dummy = $value$plusargs("b=%b", b);
dummy = $value$plusargs("b0=%b", b0);
dummy = $value$plusargs("b1=%b", b1);
dummy = $value$plusargs("b2=%b", b2);
dummy = $value$plusargs("b3=%b", b3);
#1
$display("Output: %b",Y);

$finish;
end

endmodule

