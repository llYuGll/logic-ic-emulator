module SN74LS153_TB;

	// Inputs
	reg A;
	reg B;
	reg C0;
	reg C1;
	reg C2;
	reg C3;
	reg G;

	// Outputs
	wire Y;

	// Instantiate the Unit Under Test (UUT)
	SN74LS153 uut (
		.A(A), 
		.B(B), 
		.C0(C0), 
		.C1(C1), 
		.C2(C2), 
		.C3(C3), 
		.G(G), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		A = 0;B = 0;C0 = 0;C1 = 1;C2 = 1;C3 = 0;G = 0;//INITALLY OUTPUT SHOULD BE0
#10; A=0;B=1;  //SHOULD GIVE Y=1
#10; A=1;B=1;  //SHOULD GIVE Y=0
#10; G=1;  //SHOULD GIVE Y=0
//change
C0 = 1;C1 = 0;C2 = 0;C3 = 0;
#10;G = 0;A=0;B=0; //SHOULD GIVE Y=1
#10; A=1;B=1; //SHOULD GIVE Y=0	
	end

initial #80 $finish;	
initial begin 
$monitor(" %0d :  C0:%b C1:%b C2:%b C3:%b ----> Y:%b",$time,C0,C1,C2,C3,Y);
end
      
endmodule


