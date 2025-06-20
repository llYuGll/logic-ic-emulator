#SN74LS181 - 4 bit ALU IC

This is very famous IC, in a sense that all students (at least from my college) will eventually use it in their projects, either for micro-computers or embedded. This IC can perform all arithmetic operations as well as many logical operations. I had first encountered it while making 8 bit breadboard computer, it was heart of ALU.
It is one of those ICs whose Datasheet I found very challenging to understand. So here ill try to explain in simple words. The Verilog code will give better understanding of its working. Also look for its RTL level image provided in DOC section.

**Working**
It works on two 4-bit inputs (A and B) and produces a 4-bit output, along with carry and other status signals.
It has 4 select operation lines(S3,S2,S1,S0) and a Mode (M) select line to choose between Arithmetic or logical operation.
Cn ( carry in) input also can be provided. Carry in and Carry out make it possible to cascade these IC to perform 8,16,32 bit operations.
**Here ill assume Active High data**- for those of readers who know what this means, have probably been through the datasheet of TI, I think this creates un-necessary confusion. Ill suggest to stick with this logic as it does not create difference. (others can ignore this , and continue reading.)

The internal working of this IC as expected is Decoding circuit. And can be referred through Datasheet. For using IC it is not needed to go through the internal working, Verilog code can give RTL level idea of how it works.

**Function Table**
```
                                                                                        (Arithmetic)

| S3 | S2 | S1 | S0 | M = H (Logic Functions)     | M = L, Cn = H (No Carry)                 | M = L, Cn = L (With Carry)               |
|----|----|----|----|-----------------------------|------------------------------------------|------------------------------------------|
| L  | L  | L  | L  | F = A̅                       | F = A                                    | F = A PLUS 1                             |
| L  | L  | L  | H  | F = A̅ + B̅                   | F = A + B̅                                | F = (A + B̅) PLUS 1                       |
| L  | L  | H  | L  | F = A̅B                      | F = A + B̅                                | F = (A + B̅) PLUS 1                       |
| L  | L  | H  | H  | F = 0                       | F = MINUS 1 (2’s COMPL)                  | F = ZERO                                 |
| L  | H  | L  | L  | F = AB̅                      | F = A PLUS AB̅                            | F = A PLUS AB̅ PLUS 1                     |
| L  | H  | L  | H  | F = B̅                       | F = (A + B) PLUS AB̅                      | F = (A + B) PLUS AB̅ PLUS 1               |
| L  | H  | H  | L  | F = A ⊕ B                  | F = A MINUS B MINUS 1                    | F = A MINUS B                            |
| L  | H  | H  | H  | F = AB̅                      | F = AB̅ MINUS 1                           | F = AB̅                                   |
| H  | L  | L  | L  | F = A̅ + B                   | F = A PLUS AB                            | F = A PLUS AB PLUS 1                     |
| H  | L  | L  | H  | F = A ⊕ B                  | F = A PLUS B                             | F = A PLUS B PLUS 1                      |
| H  | L  | H  | L  | F = B                       | F = (A + B̅) PLUS AB                      | F = (A + B̅) PLUS AB PLUS 1               |
| H  | L  | H  | H  | F = AB                      | F = AB MINUS 1                           | F = AB                                   |
| H  | H  | L  | L  | F = 1                       | F = A PLUS A†                            | F = A PLUS A PLUS 1                      |
| H  | H  | L  | H  | F = A + B̅                   | F = (A + B̅) PLUS A                       | F = (A + B̅) PLUS A PLUS 1                |
| H  | H  | H  | L  | F = A + B                   | F = (A + B̅) PLUS A                       | F = (A + B̅) PLUS A PLUS 1                |
| H  | H  | H  | H  | F = A                       | F = A MINUS 1                            | F = A                                    |



```
credit for table to TI datasheet for function table image and chat-gpt for converting it into text.



```
A0–A3, B0–B3: Four-bit input operands (A and B)
S0–S3: Function select inputs (determine the operation)
M: Mode input (selects between arithmetic and logic operations)
Cn: Carry-in input
F0–F3: Four-bit output result
Cn+4: Carry-out output
A=B: Output indicating if A equals B (comparator function)
P, G: Carry propagate and generate outputs (used for carry lookahead)
```

Also we can use this IC with 74182 for carry look ahead arithmetic as P and G pins are also available .(more about carry look ahead can be found in DD Morris mano, combinational chapter)

I think this is enough for usage of the IC, RTL synthesis (image) provides a better illustration for understanding, find in DOC.


