//MY_NOT: bitwise not

//A: entrada (op_size bits)
//R: resultado (op_size bits)
//CCR: condition code registers

//R=~B

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

module my_not(R, CCR, A);

parameter op_size = 4;
parameter c_mask='b1000, v_mask='b0100, n_mask='b0010, z_mask='b0001;   //mascaras para los flags del ccr

output reg [3:0] R, CCR;     //resultado
input[3:0] A;           //input

always @(A) 
    begin
    //seteo resultado
    R = ~A;
    

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
module my_not_tst;
reg dummy;

wire [3:0] R, CCR;  //resultado y condition code register
reg [3:0] A;        //input del not


my_not tst_not(R, CCR, A);
initial begin
dummy = $value$plusargs("A=%d", A);
#3 //my_not tarda 1 tick en hacer la suma y 2 ticks en acomodar el ccr
$display(" A=%b", A);
$display("~A=%b",R);
$display("CVNZ");
$display("%b", CCR);

$finish;
end

endmodule
*/