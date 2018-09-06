//SHL: shift left

//A: registro de entrada (op_size bits)
//R: resultado (op_size bits)
//CCR: condition code registers

//R= A<<1

//CCR con 4 flags:

//C: carry flag. 
//   =MSB de A

//V: overflow flag.
//   =1 si A y R tienen signos opuestos.
//   =0 si A y R tienen el mismo signo.
//...Nota: V=N^C, una vez setados N y C.

//N: negative flag. 
//   =1 si el MSB de R es 1 (es decir, si en interpretacion signada, R<0).
//   =0 si el MSB de R es 0 (es decir, si en interpretacion signada, R>=0).

//Z: zero flag
//   =1 si R==0.
//   =1 si R!=0.

//5 ticks: 1 tick calculo, 4 ticks CCR

module shl(R, CCR, A);

parameter op_size = 4;
parameter c_mask='b1000, v_mask='b0100, n_mask='b0010, z_mask='b0001;   //mascaras para los flags del ccr


output reg [3:0] CCR;           //condition code register
output reg [op_size-1:0] R;     //resultado
input[op_size-1:0] A;           //input

always @(A) 
    begin
    //seteo resultado
    R = A<<1;
    #1

    //seteo carry flag
    if(A[op_size-1])
        begin
        CCR <= (CCR | c_mask);
        //$display("C=1");
    end else begin 
        CCR <= (CCR & ~c_mask);
        //$display("C=0");
        end    
    #1

    //seteo negative
    if( R[op_size - 1] )
        begin
        CCR <= (CCR | n_mask);
    end else begin 
        CCR <= (CCR & (~n_mask));
        end
    #1

    //seteo overflow flag
    if(((CCR & n_mask) && !(CCR & c_mask)) ||(!(CCR & n_mask) &&  (CCR & c_mask))) //N ^ C
        begin 
        CCR <= (CCR | v_mask);
    end else begin
        CCR <= (CCR & (~v_mask));
        end

    #1

    //seteo zero
    if(!R)
        begin
        CCR <= (CCR | z_mask);
    end else begin
        CCR <= (CCR & (~z_mask));
        end

    end

endmodule

/*
module shl_tst;
reg dummy;

wire [3:0] R, CCR;  //resultado y condition code register
reg [3:0] A;        //input del shl


shl tst_shl(R, CCR, A);
initial begin
dummy = $value$plusargs("A=%d", A);
#5 //shl tarda 1 tick en hacer la suma y 4 ticks en acomodar el ccr
$display("   A=%b",A);
$display("A<<1=%b",R);
$display("CVNZ");
$display("%b", CCR);

$finish;
end

endmodule
*/