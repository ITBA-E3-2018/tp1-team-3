#!/bin/bash
sudo iverilog environmentMux4.v -o mux4.out

echo "S0=0 S1=0  -> Y=X0"
vvp mux4.out +a=0 +b=0  +b0=0 +b1=0 +b2=0 +b3=0 
vvp mux4.out +a=0 +b=0  +b0=1 +b1=0 +b2=0 +b3=0

echo "S0=0 S1=1  -> Y=X1"
vvp mux4.out +a=0 +b=1  +b0=0 +b1=0 +b2=0 +b3=0 
vvp mux4.out +a=0 +b=1  +b0=0 +b1=1 +b2=0 +b3=0 

echo "S0=1 S1=0  -> Y=X2"
vvp mux4.out +a=1 +b=0  +b0=0 +b1=0 +b2=0 +b3=0 
vvp mux4.out +a=1 +b=0  +b0=0 +b1=0 +b2=1 +b3=0 

echo "S1=0 S1=1  -> Y=X3"
vvp mux4.out +a=1 +b=1 +b0=0 +b1=0 +b2=0 +b3=0 
vvp mux4.out +a=1 +b=1 +b0=0 +b1=0 +b2=0 +b3=1 
 
sudo rm mux4.out

