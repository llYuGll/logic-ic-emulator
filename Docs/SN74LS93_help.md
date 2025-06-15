# 74LS93  
This IC is a binary counter IC which can act as mod-2/8/16 signal generator. Mod refers to how many states the counter can achieve (and it also appears like timing signal is divided). This IC has two clocks and 4 flip-flops. We know that ideally it should be able to go in 16 states (which it can), but additionally, the flip-flops are broken into two sets: {D,C,B} and {A}, where A has a separate clock pin and B has a separate clock pin (clock pin of C is internally connected to output of ff_B and that of D to output of ff_C).

Hence, we can perform 3 kinds of signal division:  
- **Mod 2**: Use external clock directly in CKA (pin 14) and leave {D,C,B} unconnected.  
- **Mod 8**: Use external clock directly in CKB (pin 1) and leave {A} unconnected.  
- **Mod 16** (most widely used): Use external clock in `CKA` and connect output of ff_A (QA = pin 12) to `CKB`.  

In my Verilog module, I’ll show an RTL-level description of Mod 16 operation. A structural description (using instantiation) would be more suitable for directly using any mod.  

Another important point i noted from the datasheet is that- CKA triggers on positive edge but CKB triggers on negative edge. It looks like this might create non uniform timed stated but it doesn't! find output wave form for 7493 in DOC for more help.

This explanation should suffice to use this IC. I will use the 7493 in one of my projects—find it in the **Implement** module of this repo.  

For readers who wish to understand how the IC works internally:  
- Read **Morris Mano’s *Digital Design***, **Chapter: Registers and Counters** (section on ripple counters).  
- It’s simple: the negative edge of one flip-flop’s output triggers the next flip-flop. Very interesting—read and find out!  

---

### Mod 16 State Table  

| COUNT | QD  | QC  | QB  | QA  |  
|-------|-----|-----|-----|-----|  
| 0     | L   | L   | L   | L   |  
| 1     | L   | L   | L   | H   |  
| 2     | L   | L   | H   | L   |  
| 3     | L   | L   | H   | H   |  
| 4     | L   | H   | L   | L   |  
| 5     | L   | H   | L   | H   |  
| 6     | L   | H   | H   | L   |  
| 7     | L   | H   | H   | H   |  
| 8     | H   | L   | L   | L   |  
| 9     | H   | L   | L   | H   |  
| 10    | H   | L   | H   | L   |  
| 11    | H   | L   | H   | H   |  
| 12    | H   | H   | L   | L   |  
| 13    | H   | H   | L   | H   |  
| 14    | H   | H   | H   | L   |  
| 15    | H   | H   | H   | H   |  

**Note:** QA is connected to CKB. Also R0 and R1 are master reset (asynchronous)-(for two sets of flipflops as discussed)- they are used to get counter in initial known state. 
