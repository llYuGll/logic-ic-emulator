# SN74LS74

This is the first clocked circuit IC in this repository. It contains two positive-edge-triggered D flip-flops. This IC also supports negative-logic asynchronous Clear and Preset.

When Preset and Clear are inactive (high), data at the D inputs is transferred to the outputs on the positive-going edge of the clock pulse. It also has complemented output pins.

D flip-flops are building blocks of most sequential circuits because of their simple transferable logic:  
*Q(t+1) = D*.  
I will use them in FSMs that I will be uploading in the Implement section of this repo (coming soon).

---

## Function Table

| PRE | CLR | CLK | D   | Q   | Q̅   |
|-----|-----|-----|-----|-----|-----|
| L   | H   | X   | X   | H   | L   |
| H   | L   | X   | X   | L   | H   |
| L   | L   | X   | X   | H   | H   |
| H   | H   | ↑   | L   | L   | H   |
| H   | H   | ↑   | H   | H   | L   |
| H   | H   | L   | X   | Q₀  | Q̅₀  |

**Legend:**  
- **L** = Low  
- **H** = High  
- **X** = Irrelevant  
- **↑** = Rising edge of clock  
- **Q₀/Q̅₀** = Previous state of Q/Q̅  

---

*Credits: TI datasheet*
Note - TI datasheet mentions clearly that both clear and preset should not be low simultaneously - Invalid input.

For more information, I suggest reading the *Sequential Logic* chapter from Morris Mano's **Digital Design**.
