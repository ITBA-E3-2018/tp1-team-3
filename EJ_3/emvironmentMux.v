`include "mux8.v"
module environmentMux;
reg dummy;
//module mux8(Y,X0,X1,X2,X3,X4,X5,X6,X7,S1,S2,S3);
reg a,b,c,b0,b1,b2,b3, b4,b5,b6,b7;
wire Y;
mux8 mux8t(Y,b0,b1,b2,b3,b4,b5,b6,b7,a,b,c);
initial begin
dummy = $value$plusargs("a=%b", a);
dummy = $value$plusargs("b=%b", b);
dummy = $value$plusargs("c=%b", c);
dummy = $value$plusargs("b0=%b", b0);
dummy = $value$plusargs("b1=%b", b1);
dummy = $value$plusargs("b2=%b", b2);
dummy = $value$plusargs("b3=%b", b3);
dummy = $value$plusargs("b4=%b", b4);
dummy = $value$plusargs("b5=%b", b5);
dummy = $value$plusargs("b6=%b", b6);
dummy = $value$plusargs("b7=%b", b7);
#1
$display("Output: %b",Y);

$finish;
end

endmodule

