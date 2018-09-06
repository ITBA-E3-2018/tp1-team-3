//SUM: suma de dos numeros

//A y B: entradas (op_size bits)
//R: resultado (op_size bits)
//CCR: condition code registers

//R=A+B

//CCR con 4 flags:

//C: carry flag. 
//   =1 si hubo carry en el MSB.
//   =0 si no hubo carry en el MSB.

//V: overflow flag. 
//   =1 si la suma de dos numeros negativos es positiva.
//   =0 si la suma de dos numeros negativos es positiva.
//   (con interpretacion signada)

//N: negative flag. 
//   =1 si el MSB de R es 1 (es decir, si en interpretacion signada, R<0).
//   =0 si el MSB de R es 0 (es decir, si en interpretacion signada, R>=0).

//Z: zero flag
//   =1 si R==0.
//   =1 si R!=0.

//5 ticks: 1 tick calculo, 4ticks CCR

module sum(R, CCR, A, B);

parameter op_size = 4;
parameter c_mask='b1000, v_mask='b0100, n_mask='b0010, z_mask='b0001;   //mascaras para los flags del ccr


output reg [3:0] CCR;           //condition code register
output reg [op_size-1:0] R;     //resultado
input[op_size-1:0] A,B;         //input

always @(A,B) 
    begin
    //seteo resultado
    R = A+B;
    #1

    //seteo carry flag
    if( (A[op_size-1] &&  B[op_size-1])
     || (A[op_size-1] && ~R[op_size-1])
     || (B[op_size-1] && ~R[op_size-1]))
        begin
        CCR <= (CCR | c_mask);
        //$display("C=1");
    end else begin 
        CCR <= (CCR & ~c_mask);
        //$display("C=0");
        end    
    #1

    //seteo overflow flag
    if( (A[op_size-1] && B[op_size-1] && ~R[op_size-1])
     || (A[op_size-1] && B[op_size-1] && ~R[op_size-1]))
        begin 
        CCR <= (CCR | v_mask);
        //$display("V=1"); 
    end else begin
        CCR <= (CCR & (~v_mask));
        //$display("V=0");
        end
        
    #1


    //seteo negative
    if( R[op_size - 1] )
        begin
        CCR <= (CCR | n_mask);
//        $display("N=1");
    end else begin 
        CCR <= (CCR & (~n_mask));
//        $display("N=0");
        end
    #1


    //seteo zero
    if(!R)
        begin
        CCR <= (CCR | z_mask);
//        $display("Z=1");
    end else begin
        CCR <= (CCR & (~z_mask));
//        $display("Z=0");
        end


    end

endmodule

/*
module sum_tst;
reg dummy;

wire [3:0] R, CCR;  //resultado y condition code register;  
reg [3:0] A,B;      //inputs de la suma


sum tst_sum(R, CCR, A, B);
initial begin
dummy = $value$plusargs("A=%d", A);
dummy = $value$plusargs("B=%d", B);
#5 //sum tarda 1 tick en hacer la suma y 4 tick en acomodar el ccr
$display("A=%d",A);
$display("B=%d",B);
$display("A+B=%d",R);
$display("CVNZ");
$display("%b", CCR);

$finish;
end

endmodule
*/