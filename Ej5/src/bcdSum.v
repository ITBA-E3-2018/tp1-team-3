module bcdSum(A,B,BCD0,BCD1);
input [3:0] A, B;
output reg [3:0] BCD0,BCD1;
reg [7:0] C;
    always @(A or B) begin
    C=A+B;
     BCD1=0;
     if (C>9)
     begin
     C=C-10;
     BCD1=1;
     end
     BCD0=C;
    end


endmodule
