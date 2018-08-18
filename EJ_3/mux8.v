//Tabla de verdad MUX
//input -> S1,S2,S3,X0 a X7
//output->Y
//  S1  S2  S3  |   Y
//--------------------
//  0   0   0   |   X0
//  0   0   1   |   X1
//  0   1   0   |   X2
//  0   1   1   |   X3
//  1   0   0   |   X4
//  1   0   1   |   X5
//  1   1   0   |   X6
//  1   1   1   |   X7


module mux8(Y,X0,X1,X2,X3,X4,X5,X6,X7,S1,S2,S3);
input X0,X1,X2,X3,X4,X5,X6,X7,S1,S2,S3;
output reg Y;

    always @(X0 or X1 or X2 or X3 or X4 or X5 or X6 or X7 or S1 or S2 or S3) begin
        if ((S1 == 1'b0)&&(S2==1'b0)&&((S3==1'b0)))
            Y=X0;
        if ((S1 == 1'b0)&&(S2==1'b0)&&((S3==1'b1)))
            Y=X1;
        if ((S1 == 1'b0)&&(S2==1'b1)&&((S3==1'b0)))
            Y=X2;
        if ((S1 == 1'b0)&&(S2==1'b1)&&((S3==1'b1)))
            Y=X3;
        if ((S1 == 1'b1)&&(S2==1'b0)&&((S3==1'b0)))
            Y=X4;
        if ((S1 == 1'b1)&&(S2==1'b0)&&((S3==1'b1)))
            Y=X5;
        if ((S1 == 1'b1)&&(S2==1'b1)&&((S3==1'b0)))
            Y=X6;
        if ((S1 == 1'b1)&&(S2==1'b1)&&((S3==1'b1)))
            Y=X7;    



    end


endmodule
