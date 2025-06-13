module SN74LS138_TB;

	// Inputs
	reg G1;
	reg G2A;
	reg G2B;
	reg A;
	reg B;
	reg C;

	// Outputs
	wire Y0;
	wire Y1;
	wire Y2;
	wire Y3;
	wire Y4;
	wire Y5;
	wire Y6;
	wire Y7;

	// Instantiate the Unit Under Test (UUT)
	SN74LS138 uut (
		.G1(G1), 
		.G2A(G2A), 
		.G2B(G2B), 
		.A(A), 
		.B(B), 
		.C(C), 
		.Y0(Y0), 
		.Y1(Y1), 
		.Y2(Y2), 
		.Y3(Y3), 
		.Y4(Y4), 
		.Y5(Y5), 
		.Y6(Y6), 
		.Y7(Y7)
	);

	initial begin
	// enabled condition
    G1 = 1;
	 G2A = 0; 
	 G2B = 0;
    {C, B, A} = 0;#10;
	 {C, B, A} = 1;#10;
	 {C, B, A} = 2;#10;
	 {C, B, A} = 3;#10;
	 {C, B, A} = 7;#10;
   

    // Testing disabled conditions
    G1 = 0; G2A = 0; G2B = 0; #10;
    G1 = 1; G2A = 1; G2B = 0; #10;
    #10 $finish;
  end

  initial begin
    $monitor("Time=%0d |G1=%b G2A=%b G2B=%b| CBA=%b → Y=%b%b%b%b%b%b%b%b",
             $time, G1, G2A, G2B, {C,B,A}, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7);
  end
endmodule
