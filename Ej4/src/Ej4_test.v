module test_compA2();

    reg [3:0]in;        // es un reg porque lo guardo en memoria.
    wire [3:0] out;     //es un cable, una respuesta al input, no lo guardo en memoria.

    compA2 my_compA2(in, out);

    integer contador;

    initial begin       //corre una vez algo     

        for (contador = 0; contador<16; contador = contador + 1) begin
            in = contador; 
            //espera un tick para actualizar estado
            #1 $display("La entrada es %d%d%d%d \n", in[3], in[2], in[1], in[0]);
            $display("La salida es %d%d%d%d \n", out[3], out[2], out[1], out[0]);
        end

    end

endmodule