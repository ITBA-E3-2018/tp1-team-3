#!/bin/bash
sudo iverilog emvironmentMux.v -o mux8.out

echo "S1=0 S2=0 S3=0 -> Y=X0"
vvp mux8.out +a=0 +b=0 +c=0 +b0=0 +b1=0 +b2=0 +b3=0 +b4=0 +b5=0 +b6=0 +b7=0
vvp mux8.out +a=0 +b=0 +c=0 +b0=1 +b1=0 +b2=0 +b3=0 +b4=0 +b5=0 +b6=0 +b7=0

echo "S1=0 S2=0 S3=1 -> Y=X1"
vvp mux8.out +a=0 +b=0 +c=1 +b0=0 +b1=0 +b2=0 +b3=0 +b4=0 +b5=0 +b6=0 +b7=0
vvp mux8.out +a=0 +b=0 +c=1 +b0=0 +b1=1 +b2=0 +b3=0 +b4=0 +b5=0 +b6=0 +b7=0

echo "S1=0 S2=1 S3=0 -> Y=X2"
vvp mux8.out +a=0 +b=1 +c=0 +b0=0 +b1=0 +b2=0 +b3=0 +b4=0 +b5=0 +b6=0 +b7=0
vvp mux8.out +a=0 +b=1 +c=0 +b0=0 +b1=0 +b2=1 +b3=0 +b4=0 +b5=0 +b6=0 +b7=0

echo "S1=0 S2=1 S3=1 -> Y=X3"
vvp mux8.out +a=0 +b=1 +c=1 +b0=0 +b1=0 +b2=0 +b3=0 +b4=0 +b5=0 +b6=0 +b7=0
vvp mux8.out +a=0 +b=1 +c=1 +b0=0 +b1=0 +b2=0 +b3=1 +b4=0 +b5=0 +b6=0 +b7=0

echo "S1=1 S2=0 S3=0 -> Y=X4"
vvp mux8.out +a=1 +b=0 +c=0 +b0=0 +b1=0 +b2=0 +b3=0 +b4=0 +b5=0 +b6=0 +b7=0
vvp mux8.out +a=1 +b=0 +c=0 +b0=0 +b1=0 +b2=0 +b3=0 +b4=1 +b5=0 +b6=0 +b7=0

echo "S1=0 S2=0 S3=1 -> Y=X5"
vvp mux8.out +a=1 +b=0 +c=1 +b0=0 +b1=0 +b2=0 +b3=0 +b4=0 +b5=0 +b6=0 +b7=0
vvp mux8.out +a=1 +b=0 +c=1 +b0=0 +b1=0 +b2=0 +b3=0 +b4=0 +b5=1 +b6=0 +b7=0

echo "S1=1 S2=1 S3=0 -> Y=X6"
vvp mux8.out +a=1 +b=0 +c=1 +b0=0 +b1=0 +b2=0 +b3=0 +b4=0 +b5=0 +b6=0 +b7=0
vvp mux8.out +a=1 +b=0 +c=1 +b0=0 +b1=0 +b2=0 +b3=0 +b4=0 +b5=0 +b6=1 +b7=0

echo "S1=1 S2=1 S3=1 -> Y=X7"
vvp mux8.out +a=1 +b=1 +c=1 +b0=0 +b1=0 +b2=0 +b3=0 +b4=0 +b5=0 +b6=0 +b7=0
vvp mux8.out +a=1 +b=1 +c=1 +b0=0 +b1=0 +b2=0 +b3=0 +b4=0 +b5=0 +b6=0 +b7=1


sudo rm mux8.out