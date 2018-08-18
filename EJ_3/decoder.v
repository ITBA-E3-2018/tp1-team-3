
//Tabla de verdad del Decoder
//Ik -> inputs
//Ok -> outputs
//I1    I2  |   O1  O2  O3  O4  
//----------------------------
//0     0   |   0   0   0   1
//0     1   |   0   0   1   0
//1     0   |   0   1   0   0
//1     1   |   1   0   0   0
//
module decoder(O1,O2,O3,O4,I1,I2);
output reg O1;
output reg O2;
output reg O3;
output reg O4;
input I1;
input I2;
always @(I1 or I2) begin
    O1=1'b0;
    O2=1'b0;
    O3=1'b0;
    O4=1'b0;
        if ((I1 == 1'b0)&&(I2==1'b1))
        O3=1'b1;

        if ((I1 == 1'b1)&&(I2==1'b0))
        O2=1'b1;

        if ((I1 == 1'b1)&&(I2==1'b1))
        O1=1'b1;

        if ((I1 == 1'b0)&&(I2==1'b0))
        O4=1'b1;

    end

endmodule
