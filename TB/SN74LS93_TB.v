
module SN74LS93_TB;

	// Inputs
	reg R0;
	reg R1;
	reg CKA;

	// Outputs
	wire QD;
	wire QC;
	wire QB;
	wire QA;

	// Instantiate the Unit Under Test (UUT)
	SN74LS93 uut (
		.R0(R0), 
		.R1(R1), 
		.CKA(CKA), 
		.QD(QD), 
		.QC(QC), 
		.QB(QB), 
		.QA(QA)
	);
	 
	always begin #10;CKA<=~CKA;end
	initial begin
		// Initialize begin state to 0000
		R0 = 1;
		R1 = 1;
		CKA = 0;
		#5;
		R0=0;R1=0;
	end
initial begin #300; $finish; end
initial begin
$monitor("time:%0d state= %b %b %b %b",$time,QD,QC,QB,QA);end   
endmodule


