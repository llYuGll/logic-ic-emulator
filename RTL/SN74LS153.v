module SN74LS153(
    input A,
    input B,
    input C0,
    input C1,
    input C2,
    input C3,
    input G,
    output reg Y
    );

// In reality this IC has two enable low inputs G0 and G1, but i am using iust G to denote both
// Also called data selector-

always @(*) begin
if(G) Y<=1'b0;
else 
	case ({B,A})
	 2'b00: Y<=C0;
	 2'b01: Y<=C1;
	 2'b10: Y<=C2;
	 2'b11: Y<=C3;
	endcase
end
endmodule
