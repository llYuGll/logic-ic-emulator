
module d_ff (
    input clk,    // Clock input (positive edge triggered)
    input d,      // Data input
    output reg q  // Data output
);

always @(posedge clk) begin
    q <= d;  // Capture input on rising clock edge
end

endmodule