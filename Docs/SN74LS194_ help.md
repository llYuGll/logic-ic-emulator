#SN74LS194_ Universal Shift Register

This IC has every functionality that we could expect from shift registers- hence the name Universal Shift register. 
IC can handel-1)Serial Shift right 2)Serial Shift Left 3)Parallel Loading  4)No change cycle(clock inhibitor action) 

For choosing from these operations it has 2 special pins S1 and S0 (pin 10,9). Apart from that it also has asynchronous master Clear.
IC provides parallel output through- QA(MSB),QB,QC,QD 
pin7 - SL SER - should have data that we want to push to QD- performing shift left operation, note that the previous QA data will be lost, Also just providing data at pin 7 does not initiate shift unless 
`{S1,S0}=10`

similarly SR SER Pin 2 is for right shift, hence the data at pin will be pushed to QA and QD will be lost (shift right) operation. For enabling shift right `{S1,S0}=01`

**Note-** The shifting takes place at rising edge of CLK provided at pin11. 

For parallel load operation- `{S1,S0}=11` This will transfer `(A,B,C,D)=(QA,QB,QC,QD)` at positive edge of clock.

If `{S1,S0}=00` this is no change mode where there is no change in any of the outputs.(their previous value is preserved.)

Function table Summarizes all this info,(credits TI datasheet)

**FUNCTION TABLE**

```
CLEAR  MODE   CLOCK  SERIAL    PARALLEL      OUTPUTS
       S1 S0         LEFT RIGHT  A B C D     QA  QB  QC  QD
-------------------------------------------------------------
 L     X  X    X     X    X     X X X X      L   L   L   L
 H     X  X    L     X    X     X X X X      QA0 QB0 QC0 QD0
 H     H  H    ^     X    X     a b c d      a   b   c   d
 H     L  L    ^     X    X     X X X X      QA0 QB0 QC0 QD0
 H     L  H    ^     X    L     X X X X      L   QA0 QB0 QC0
 H     L  H    ^     X    H     X X X X      H   QA0 QB0 QC0
 H     H  L    ^     L    X     X X X X      QB0 QC0 QD0 L
 H     H  L    ^     H    X     X X X X      QB0 QC0 QD0 H
```
L = Low ; H = High ; X = Irrelevant ; ^ = Rising edge of clock


The internal working of IC is using 4 flipflops and a combinational control logic, the complete explanation of working can be found in Morris mano's Digital Design's Universal Shift register section. 


