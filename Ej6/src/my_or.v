//MY_OR: bitwise or de dos numeros

//A y B: entradas (op_size bits)
//R: resultado (op_size bits)
//CCR: condition code registers

//R=A|B

//CCR con 4 flags:

//C: carry flag.
//   no se modifica

//V: overflow flag. 
//   no se modifica

//N: negative flag. 
//   =1 si el MSB de R es 1 (es decir, si en interpretacion signada, R<0).
//   =0 si el MSB de R es 0 (es decir, si en interpretacion signada, R>=0).

//Z: zero flag
//   =1 si R==0.
//   =1 si R!=0.

//3 ticks: 1 tick calculo, 2 ticks CCR

module my_or(R, CCR, A, B);

parameter op_size = 4;
parameter c_mask='b1000, v_mask='b0100, n_mask='b0010, z_mask='b0001;   //mascaras para los flags del ccr


output reg [3:0] CCR;           //condition code register
output reg [op_size-1:0] R;     //resultado
input[op_size-1:0] A, B;        //input

always @(A,B) 
    begin
    //seteo resultado
    R = A|B;
    #1

    //seteo negative
    if( R[op_size - 1] )
        begin
        CCR <= (CCR | n_mask);
        //$display("N=1");
    end else begin 
        CCR <= (CCR & (~n_mask));
        //$display("N=0");
        end
    #1


    //seteo zero
    if(!R)
        begin
        CCR <= (CCR | z_mask);
        //$display("Z=1");
    end else begin
        CCR <= (CCR & (~z_mask));
        //$display("Z=0");
        end

    end

endmodule

/*
module my_or_tst;
reg dummy;

wire [3:0] R, CCR;  //resultado y condition code register
reg [3:0] A, B;        //input del or


my_or tst_my_or(R, CCR, A, B);
initial begin
dummy = $value$plusargs("A=%d", A);
dummy = $value$plusargs("B=%d", B);
#3 //my_and tarda 1 tick en hacer la operacion y 2 ticks en acomodar el ccr
$display("  A=%b", A);
$display("  B=%b", B);
$display("A|B=%b",R);
$display("CVNZ");
$display("%b", CCR);

$finish;
end

endmodule
*/