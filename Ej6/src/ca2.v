//CA2: complemento a 2

//A: entrada (op_size bits)
//R: resultado (op_size bits)
//CCR: condition code registers

//R=-A

//CCR con 4 flags:

//C: carry flag. 
//   =1 si al hacer 0-A hay borrow en el MSB(es decir, si A!=0).
//   =0 si al hacer 0-A no hay borrow en el MSB (es decir, si A==0).

//V: overflow flag. 
//   =1 si al hacer 0-A hay overflow (es decir, si A==R y A!= 0).
//   =0 si al hacer 0-A no hay overflow (es decir, si A!=R o si A==0).

//N: negative flag. 
//   =1 si el MSB de R es 1 (es decir, si en interpretacion signada, R<0).
//   =0 si el MSB de R es 0 (es decir, si en interpretacion signada, R>=0).

//Z: zero flag
//   =1 si R==0.
//   =1 si R!=0.

//5 ticks: 1 tick calculo, 4 ticks CCR

module ca2(R, CCR, A);

parameter op_size = 4;
parameter c_mask='b1000, v_mask='b0100, n_mask='b0010, z_mask='b0001;   //mascaras para los flags del ccr


output reg [3:0] CCR;           //condition code register
output reg [op_size-1:0] R;     //resultado
input[op_size-1:0] A;           //input

always @(A) 
    begin
    //seteo resultado
    R = -A;
    #1

    //seteo carry flag
    if(A)
        begin
        CCR <= (CCR | c_mask);
        //$display("C=1");
    end else begin 
        CCR <= (CCR & ~c_mask);
        //$display("C=0");
        end    
    #1


    //seteo overflow flag
    if(A==R && A!=0)
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
module ca2_tst;
reg dummy;

wire [3:0] R, CCR;  //resultado y condition code register
reg [3:0] A;        //input del ca2


ca2 tst_ca2(R, CCR, A);
initial begin
dummy = $value$plusargs("A=%d", A);
#5 //ca2 tarda 1 tick en hacer la suma y 4 ticks en acomodar el ccr
$display(" A=%b", A);
$display("-A=%b",R);
$display("CVNZ");
$display("%b", CCR);

$finish;
end

endmodule
*/