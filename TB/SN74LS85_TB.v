
module SN74LS85_TB;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;

	// Outputs
	wire A_gr_B;
	wire A_les_B;
	wire A_eq_B;

	// Instantiate the Unit Under Test (UUT)
	SN74LS85 uut (
		.A(A), 
		.B(B), 
		.A_gr_B(A_gr_B), 
		.A_les_B(A_les_B), 
		.A_eq_B(A_eq_B)
	);

	initial begin
		A=0;B=0;#10;
		A=4;B=9;#10;
		A=10;B=9;#10;
		A=10;B=10;#10;
		A=11;B=10;#10;
		A=14;B=14;#10;	
    
	end
  initial begin
$monitor("%0d: A:%d , B:%d ,  A>B:%b , A<B:%b , A=B:%b",$time, A,B, A_gr_B, A_les_B, A_eq_B); end
 
endmodule

