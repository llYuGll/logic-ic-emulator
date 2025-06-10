//SN74LS00 IC has 4 two input nand gates
module Quad_two_input_nand_IC(
    input [1:0] A,//gate 1 inputs
    input [1:0] B,//gate 2 inputs
    input [1:0] C,// gate 3 inputs
    input [1:0] D,// gate 3 inputs
    output [3:0] Y// Outputs
    );

assign Y[0]= ~(A[0]&A[1]);
assign Y[1]= ~(B[0]&B[1]);
assign Y[2]= ~(C[0]&C[1]);
assign Y[3]= ~(D[0]&D[1]);

endmodule
