module SN74LS32 (   
	input  A1, B1,  // Gate 1 inputs (pins 1, 2)
    input  A2, B2,  // Gate 2 inputs (pins 4, 5)
    input  A3, B3,  // Gate 3 inputs (pins 9, 10)
    input  A4, B4,  // Gate 4 inputs (pins 12, 13)
    output Y1,      // Gate 1 output (pin 3)
    output Y2,      // Gate 2 output (pin 6)
    output Y3,      // Gate 3 output (pin 8)
    output Y4       // Gate 4 output (pin 11)
);

assign Y1 = A1 | B1;  //as this is single bit operation we can also use logical or(||)
assign Y2 = A2 | B2;
assign Y3 = A3 | B3;
assign Y4 = A4 | B4;

endmodule
