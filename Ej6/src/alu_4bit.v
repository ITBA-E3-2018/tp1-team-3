//opcode la instruccion
`define sum_opcode 0
`define res_opcode 1
`define and_opcode 2
`define or_opcode  3
`define not_opcode 4
`define xor_opcode 5
`define ca2_opcode 6
`define shl_opcode 7


module alu_4bit(R, CCR, A, B, opcode);

output reg [3:0] CCR;   //condition code register
output reg [3:0] R;     //resultado
input[3:0] A, B;        //input
input [2:0] opcode;     //opcodes van de 0 a 7

wire [3:0] R_ca2, R_and, R_not, R_xor, R_res, R_shl, R_sum, R_or;   //Guarda los resultados de todas las operaciones
wire [3:0] CCR_ca2, CCR_and, CCR_not, CCR_xor, CCR_res, CCR_shl, CCR_sum, CCR_or;   //Guarda los resultados de todas las operaciones

ca2 ca2_(R_ca2, CCR_ca2, A);
my_and and_(R_and, CCR_and, A, B); 
my_not not_(R_not, CCR_not, A);
my_or or_(R_or, CCR_or, A, B);
my_xor xor_(R_xor, CCR_xor, A, B);
res res_(R_res, CCR_res, A, B);
shl shl_(R_shl, CCR_shl, A);
sum sum_(R_sum, CCR_sum, A, B);


always @(*)

  begin
    case (opcode)
        `sum_opcode: begin 
        $display("suma:");
        R=R_sum;
        CCR=CCR_sum;
      end `res_opcode: begin 
        $display("resta:");
        R=R_res;
        CCR=CCR_res;
      end `and_opcode: begin 
        $display("and:");
        R=R_and;
        CCR=CCR_and;
      end `or_opcode:  begin 
        $display("or:");
        R=R_or;
        CCR=CCR_or;
      end `not_opcode: begin 
        $display("not:");
        R=R_not;
        CCR=CCR_not;
      end `xor_opcode: begin 
        $display("xor:");
                R=R_xor;
        CCR=CCR_xor;
      end `ca2_opcode: begin 
        $display("ca2:");
        R=R_ca2;
        CCR=CCR_ca2;
      end `shl_opcode: begin 
        $display("shl:");
        R=R_shl;
        CCR=CCR_shl;
      end
  endcase
end
endmodule


module alu_tst;
reg dummy;

wire [3:0] R, CCR;  //resultado y condition code register;  
reg [3:0] A,B;      //inputs 
reg [2:0] opcode;   //instruccion


sum tst_sum(R, CCR, A, B);
initial begin
dummy = $value$plusargs("A=%d", A);
dummy = $value$plusargs("B=%d", B);
dummy = $value$plusargs("opcode=%d", opcode);
#5 //sum tarda 1 tick en hacer la suma y 4 tick en acomodar el ccr

#10
$display("Decimal:");
$display(" A = %d", A);
$display(" B = %d", B);
$display(" R = %d", R);
$display("Binario:");
$display(" A = %b", A);
$display(" B = %b", B);
$display(" R = %b", R);

$display("A=%d",A);
$display("B=%d",B);
$display("A+B=%d",R);
$display("CVNZ");
$display("%b", CCR);

$finish;
end

endmodule