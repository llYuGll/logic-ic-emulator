#SN74LS85- magnitude comparator

This IC compares 2 -  4 bit numbers, it can also be cascaded to compare larger numbers. Its logic is quite simple.
A={A3,A2,A1,A0}
B={B3,B2,B1,B0}

and it has 3 outputs A>B(pin5) , A=B (pin6), A<B (pin7). 

if A3>B3  pin5 goes high

if A3=B3 and A2>B2 pin 5 goes high

if A3=B3 and A2=B2 and A1>B1 pin 5 goes high

if A3=B3 and A2=B2 and A1=B1 A0>B0 pin 5 goes high

if A3=B3 and A2=B2 and A1=B1 A0=B0 pin 6 goes high

similarly 

if A3<B3  pin7 goes high

if A3=B3 and A2<B2 pin 7 goes high

if A3=B3 and A2=B2 and A1<B1 pin 7 goes high

If A3=B3 and A2=B2 and A1=B1 A0<B0 pin 7 goes high.



 