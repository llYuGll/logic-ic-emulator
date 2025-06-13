# Basic Information about IC-SN74LS138

This document covers basic information needed to understand IC-SN74LS138: a 3-to-8 decoder.

## Features

- **Enabled if (G1=high and G2A=low and G2B=low).**
- **Outputs are active low:** All output lines are high by default but turn low if selected at input.

## Example
> ```
> {A,B,C}={1,0,0}  // meaning decimal 4 is selected
> output --> Y4=low, all else will be high.
> ```

In this example, when the select inputs are `{A,B,C}={1,0,0}` (binary 100, decimal 4), output `Y4` goes low while all other outputs remain high.

## Truth Table

| ENABLE | SELECT   | Y0 | Y1 | Y2 | Y3 | Y4 | Y5 | Y6 | Y7 |
|--------|----------|----|----|----|----|----|----|----|----|
| G1     | G2*      | C B A    |    |    |    |    |    |    |    |
| H      | X        | X X X    | H  | H  | H  | H  | H  | H  | H  | H  |
| X      | H        | X X X    | H  | H  | H  | H  | H  | H  | H  | H  |
| L      | L        | X X X    | H  | H  | H  | H  | H  | H  | H  | H  |
| L      | H        | L L L    | L  | H  | H  | H  | H  | H  | H  | H  |
| L      | H        | L L H    | H  | L  | H  | H  | H  | H  | H  | H  |
| L      | H        | L H L    | H  | H  | L  | H  | H  | H  | H  | H  |
| L      | H        | L H H    | H  | H  | H  | L  | H  | H  | H  | H  |
| L      | H        | H L L    | H  | H  | H  | H  | L  | H  | H  | H  |
| L      | H        | H L H    | H  | H  | H  | H  | H  | L  | H  | H  |
| L      | H        | H H L    | H  | H  | H  | H  | H  | H  | L  | H  |
| L      | H        | H H H    | H  | H  | H  | H  | H  | H  | H  | L  |

\*G2 = G2A + G2B  
H = high level, L = low level, X = irrelevant

## Credits

Credits: TI datasheet

## Notes

This IC can be used to implement any function represented in summation of minterms format, as it produces minterms as output. To understand more, I suggest reading the follow-up from the combinational circuits chapter from Morris Mano.

I will be using this IC in one of the FSM projects; find it in the implementation section.
