module SN74LS85(
    input [3:0] A,
    input [3:0] B,
    output reg A_gr_B,
    output reg A_les_B,
    output reg A_eq_B
    );
// This module contains only the 4 bit comparison code, for cascading add 3 more inputs from outputs of significant digit ICs
// although this operation can be performed directly like this A>B IN Verilog , the actual implimentaion follows bitwise compare
always @(*) begin 
 A_gr_B = (A>B)? 1:0;
 A_les_B = (A<B)? 1:0;
 A_eq_B = (A==B)? 1:0;
 end
endmodule
