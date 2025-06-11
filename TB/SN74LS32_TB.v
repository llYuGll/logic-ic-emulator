
module SN74LS32_TB;

	// Inputs
	reg A1;
	reg B1;
	reg A2;
	reg B2;
	reg A3;
	reg B3;
	reg A4;
	reg B4;

	// Outputs
	wire Y1;
	wire Y2;
	wire Y3;
	wire Y4;

	// Instantiate the Unit Under Test (UUT)
	SN74LS32 uut (
		.A1(A1), 
		.B1(B1), 
		.A2(A2), 
		.B2(B2), 
		.A3(A3), 
		.B3(B3), 
		.A4(A4), 
		.B4(B4), 
		.Y1(Y1), 
		.Y2(Y2), 
		.Y3(Y3), 
		.Y4(Y4)
	);

	initial begin
		// Initialize Inputs
		A1 = 0;
		B1 = 0;
		A2 = 0;
		B2 = 0;
		A3 = 0;
		B3 = 0;
		A4 = 0;
		B4 = 0;
end
    initial begin
    // Testing Gate 1 
    A1 = 0; B1 = 0; #10; //  expected Y1 = 0
    A1 = 0; B1 = 1; #10; // expected Y1 = 1
    A1 = 1; B1 = 0; #10; // expected Y1 = 1
    A1 = 1; B1 = 1; #10; // expected Y1 = 1
end 
initial begin
    // Test Gate 2 
    A2 = 0; B2 = 0; #10; // expected Y2 = 0
    A2 = 0; B2 = 1; #10; // expected Y2 = 1
    A2 = 1; B2 = 0; #10; // expected Y2 = 1
    A2 = 1; B2 = 1; #10; // expected Y2 = 1
end
    
  initial begin  #50 $finish;
  end


  initial begin
    $monitor("Time=%0t: A1=%b B1=%b → Y1=%b | A2=%b B2=%b → Y2=%b",
             $time, A1, B1, Y1, A2, B2, Y2);
  end
  
endmodule
