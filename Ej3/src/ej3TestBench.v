
module ej3TestBench;

reg Im4_0,Im4_1,Im4_2,Im4_3,Sm4_0,Sm4_1;
wire Ym4;

reg Im2_0,Im2_1,Sm2_1;
wire Ym2;

reg ID_0,ID_1;
wire Do0,Do1,Do2,Do3;



mux2 m2(Ym2,Im2_0,Im2_1,Sm2_1);
mux4 m4(Ym4,Im4_0,Im4_1,Im4_2,Im4_3,Sm4_0,Sm4_1);
decoder dec(Do0,Do1,Do2,Do3,ID_0,ID_1);


initial begin

$display("Test Bench Decoder 4 salidas");

ID_0=0;
ID_1=0;
#1
$display("Input0:%b Input1:%b Output: %b | %b | %b | %b ",ID_0,ID_1,Do0,Do1,Do2,Do3);
ID_0=0;
ID_1=1;
#1
$display("Input0:%b Input1:%b Output: %b | %b | %b | %b ",ID_0,ID_1,Do0,Do1,Do2,Do3);
ID_0=1;
ID_1=0;
#1
$display("Input0:%b Input1:%b Output: %b | %b | %b | %b ",ID_0,ID_1,Do0,Do1,Do2,Do3);
ID_0=1;
ID_1=1;
#1
$display("Input0:%b Input1:%b Output: %b | %b | %b | %b ",ID_0,ID_1,Do0,Do1,Do2,Do3);

$display("Test Bench Mux 2 salidas");
Sm2_1=0;
Im2_0=1;
#1
$display("Input0:%b Input1:%b Select:%b Output:%b",Im2_0,Im2_1,Sm2_1,Ym2);
Sm2_1=0;
Im2_0=0;
#1
$display("Input0:%b Input1:%b Select:%b Output:%b",Im2_0,Im2_1,Sm2_1,Ym2);
Im2_0=Im2_1;
Sm2_1=1;
Im2_1=1;
#1
$display("Input0:%b Input1:%b Select:%b Output:%b",Im2_0,Im2_1,Sm2_1,Ym2);
Sm2_1=1;
Im2_1=0;
#1
$display("Input0:%b Input1:%b Select:%b Output:%b",Im2_0,Im2_1,Sm2_1,Ym2);


$display("Test Bench Mux 4 salidas");

Sm4_0=0;
Sm4_1=0;
Im4_0=0;
#1
$display("Input0:%b Input1:%b Input2:%b Input3:%b Select0:%b Select1:%b Output:%b",Im4_0,Im4_1,Im4_2,Im4_3,Sm4_0,Sm4_1,Ym4);

Sm4_0=0;
Sm4_1=0;
Im4_0=1;
#1
$display("Input0:%b Input1:%b Input2:%b Input3:%b Select0:%b Select1:%b Output:%b",Im4_0,Im4_1,Im4_2,Im4_3,Sm4_0,Sm4_1,Ym4);

Im4_0=Im4_1;

Sm4_0=0;
Sm4_1=1;
Im4_1=0;
#1
$display("Input0:%b Input1:%b Input2:%b Input3:%b Select0:%b Select1:%b Output:%b",Im4_0,Im4_1,Im4_2,Im4_3,Sm4_0,Sm4_1,Ym4);

Sm4_0=0;
Sm4_1=1;
Im4_1=1;
#1
$display("Input0:%b Input1:%b Input2:%b Input3:%b Select0:%b Select1:%b Output:%b",Im4_0,Im4_1,Im4_2,Im4_3,Sm4_0,Sm4_1,Ym4);

Im4_1=Im4_2;

Sm4_0=1;
Sm4_1=0;
Im4_2=0;
#1
$display("Input0:%b Input1:%b Input2:%b Input3:%b Select0:%b Select1:%b Output:%b",Im4_0,Im4_1,Im4_2,Im4_3,Sm4_0,Sm4_1,Ym4);

Sm4_0=1;
Sm4_1=0;
Im4_2=1;
#1
$display("Input0:%b Input1:%b Input2:%b Input3:%b Select0:%b Select1:%b Output:%b",Im4_0,Im4_1,Im4_2,Im4_3,Sm4_0,Sm4_1,Ym4);
Im4_2=Im4_3;

Sm4_0=1;
Sm4_1=1;
Im4_3=0;
#1
$display("Input0:%b Input1:%b Input2:%b Input3:%b Select0:%b Select1:%b Output:%b",Im4_0,Im4_1,Im4_2,Im4_3,Sm4_0,Sm4_1,Ym4);
Sm4_0=1;
Sm4_1=1;
Im4_3=1;
#1
$display("Input0:%b Input1:%b Input2:%b Input3:%b Select0:%b Select1:%b Output:%b",Im4_0,Im4_1,Im4_2,Im4_3,Sm4_0,Sm4_1,Ym4);

$finish;
end


endmodule
