

module ej5TestBench;

reg [3:0] Num1,Num2;
wire [3:0] Digit0,Digit1;
integer i, j;

bcdSum Sumador(Num1,Num2,Digit0,Digit1);
initial begin

$display("Sumador BCD");
for (i = 0; i < 10; i = i + 1) begin
    for (j = 0; j < 10; j = j + 1) begin
    Num1=i;
    Num2=j;
    #1
    $display("%d + %d =  %d %d",i,j,Digit1,Digit0);
    

    end

end





$finish;
end


endmodule