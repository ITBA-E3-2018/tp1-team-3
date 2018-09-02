`include "decoder.v"
module environment;
reg dummy;

reg a, b;
wire b1,b2,b3,b4;
decoder dec1(.O1(b1),.O2(b2),.O3(b3),.O4(b4),.I1(a),.I2(b));
initial begin
dummy = $value$plusargs("a=%b", a);
dummy = $value$plusargs("b=%b", b);
#1
$display("Output: %b | %b | %b | %b ",b1,b2,b3,b4);

$finish;
end

endmodule
