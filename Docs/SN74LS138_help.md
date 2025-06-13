This document covers basic information needed to understand IC-SN74LS138.
3to8 decoder   
Features
= Enabled if (G1=high and G2A=low and G2B=low).
=Outputs are active low, meaning all output lines are high by default but turn low if selected at input.

Example= {A,B,C}={1,0,0} // meaning decimal 4 is selected
output--> Y4=low all else will be high.

Truth table-
                      FUNCTION TABLE

        INPUTS                                OUTPUTS
  ENABLE       SELECT        ----------------------------------------
 G1   G2*      C  B  A        Y0  Y1  Y2  Y3  Y4  Y5  Y6  Y7
 ---------------------------------------------------------------
  H     X       X  X  X        H   H   H   H   H   H   H   H
  X     H       X  X  X        H   H   H   H   H   H   H   H
  L     L       X  X  X        H   H   H   H   H   H   H   H
  L     H       L  L  L        L   H   H   H   H   H   H   H
  L     H       L  L  H        H   L   H   H   H   H   H   H
  L     H       L  H  L        H   H   L   H   H   H   H   H
  L     H       L  H  H        H   H   H   L   H   H   H   H
  L     H       H  L  L        H   H   H   H   L   H   H   H
  L     H       H  L  H        H   H   H   H   H   L   H   H
  L     H       H  H  L        H   H   H   H   H   H   L   H
  L     H       H  H  H        H   H   H   H   H   H   H   L
 ---------------------------------------------------------------

*G2 = G2A + G2B
H = high level, L = low level, X = irrelevant

~credits TI datasheet

This Ic can be used to implement any function represented in summation of minterms format
as it produces minterms as output, to understand more i suggest reading follow up from combinational circuits chapter from morris mano.
I will be using this IC in one of the FSM project, find in implement section.

