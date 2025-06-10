module QUAD_nand_TB;

	// Inputs
	reg [1:0] A;
	reg [1:0] B;
	reg [1:0] C;
	reg [1:0] D;

	// Outputs
	wire [3:0] Y;

	// Instantiate the Unit Under Test (UUT)
	Quad_two_input_nand_IC uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;
		D = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// lets test only 2 gates say A and B

  
	{A[0],A[1],B[0],B[1]}=4'b0100;
	 #10;
	{A[0],A[1],B[0],B[1]}=4'b1100;
	 #10;
	{A[0],A[1],B[0],B[1]}=4'b1010;
	 #10;
	{A[0],A[1],B[0],B[1]}=4'b1111;
	
	end  
	initial #180 $finish;
	initial begin
$monitor("input1=%b %b  || output1= %b \n input2=%b %b || output2=%b",A[0],A[1],Y[0],B[0],B[1],Y[1]);
	end			
		   
endmodule


