module compA2(b,y);

    input [3:0]b;           
    output reg [3:0]y;      //reg porque es un always y necesito guardar en memoria.

    always @ (b) begin
        y[3] = (~b[3] & (b[2] | b[1] | b[0])) | ( b[3] & (~b[2]) & (~b[1]) & (~b[0]) );
        y[2] = ~b[2] & ( b[0] | b[1] ) | ( b[2] & (~b[1]) & (~b[0]) );
        y[1] = ( (~b[1]) & b[0] ) | (~b[0]) & b[1] ;
        y[0] = b[0];
    end


endmodule

