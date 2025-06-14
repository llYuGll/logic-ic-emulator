module SN74LS74(
    input CLR_1,
    input PRE_1,
    input D_1,
    input CLK_1,
    output reg Q_1,
    output reg Q_1b, //just learned that output_b is industry satandard for complement output
    input CLR_2,
    input PRE_2,
    input D_2,
    input CLK_2,
    output reg Q_2,
    output reg Q_2b
);

// flipflop 1
always @(posedge CLK_1, negedge PRE_1, negedge CLR_1) begin
    if (~PRE_1) begin Q_1 <= 1'b1; Q_1b <= 1'b0;end
    else if (~CLR_1) begin Q_1 <= 1'b0; Q_1b <= 1'b1;end
   
	else begin                 // synchronus 
        Q_1 <= D_1;
        Q_1b <= ~D_1;
    end
	end

// flipflop 2
always @(posedge CLK_2, negedge PRE_2, negedge CLR_2) begin
    if (~PRE_2) begin Q_2 <= 1'b1; Q_2b<= 1'b0;end
    else if (~CLR_2) begin Q_2 <= 1'b0;Q_2b <= 1'b1;end
    else begin                 
        Q_2 <= D_2;
        Q_2b <= ~D_2;
    end
	end

endmodule
