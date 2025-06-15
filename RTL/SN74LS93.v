module SN74LS93(
    input R0,
    input R1,
    input CKA,
    output reg QD,
    output reg QC,
    output reg QB,
    output reg QA
);
//NOTE this is RTL description of 7493's mod 16 opration. feel free to modify it to 
// have mod 2 and mod 8, i have connected CKB to QA intrenally.
// for more help and clarity check out 7493_help.md in DOC section of this repo
// inputs and outputs follow pin digram notations from TI datasheet

// this is bit non intuative but clock of A updates on positive edge while subsequent fliflops
// trigger on neg-edge but it still gives uniformly timed states, i was confused here
// but got clarity once i checked output waveform
always @(posedge CKA, posedge R0, posedge R1) begin
    if (R0 && R1) begin QA <= 1'b0;
    end
    else begin
        QA <= QA + 1'b1; // this will behave as 1-0-1-0 with each clock
    end
end

// next set of ff's 
// as said i have already modified it to behave as mod 16, feel free to replace
// negedge QA with CKB to have mod 8 or disabled to have mod 2, check DOC help
always @(negedge QA, posedge R0, posedge R1) begin
    if (R0 && R1) begin {QD, QC, QB} <= 3'b000;
    end
    else begin
        {QD, QC, QB} <= {QD, QC, QB} + 1'b1; // Mod-8 counter
    end
end

endmodule