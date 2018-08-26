//R: resultado - CCR: condition code registers
//A y B: registros de entrada
module sum(R, CCR, A, B);
    
output reg [3:0] R, CCR;    
input[3:0] A,B;

always @(A,B) 
    begin
    R = A+B;
    end

endmodule
