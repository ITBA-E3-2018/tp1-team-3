#!/bin/bash
sudo iverilog ca2tst.v -o ca2tst.out

vvp ca2tst.out +A=0

vvp ca2tst.out +A=1

vvp ca2tst.out +A=7

vvp ca2tst.out +A=100

vvp ca2tst.out +A=-1

vvp ca2tst.out +A=-7

vvp ca2tst.out +A=-8

vvp ca2tst.out +A=-100

vvp ca2tst.out +A=15

