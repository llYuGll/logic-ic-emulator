module SN74LS138(
    input G1,
    input G2A,
    input G2B,
    input A,    // LSB
    input B,
    input C,    // MSB
    output Y0,
    output Y1,
    output Y2,
    output Y3,
    output Y4,
    output Y5,
    output Y6,
    output Y7
);

// 3 to 8 decoder, find the documentation in DOCS section, i am following TI datasheet pin
reg [7:0] Y;
assign {Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7} = Y;

always @(*) begin
    Y = 8'b11111111;
    if (G1 && ~G2A && ~G2B) begin
        case ({C, B, A})  //according to IC- C=MSB so i will follow that
            3'b000: Y[0] = 1'b0;
            3'b001: Y[1] = 1'b0;
            3'b010: Y[2] = 1'b0;
            3'b011: Y[3] = 1'b0;
            3'b100: Y[4] = 1'b0;
            3'b101: Y[5] = 1'b0;
            3'b110: Y[6] = 1'b0;
            3'b111: Y[7] = 1'b0;
        endcase
    end
end

endmodule


