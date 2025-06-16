
module SN74LS194;

	// Inputs
	reg CLK;
	reg A;
	reg B;
	reg C;
	reg D;
	reg SL;
	reg SR;
	reg S1;
	reg S0;
	reg CLR;

	// Outputs
	wire QA;
	wire QB;
	wire QC;
	wire QD;

	// Instantiate the Unit Under Test (UUT)
	SN74LS94 uut (
		.CLK(CLK), 
		.A(A), 
		.B(B), 
		.C(C), 
		.D(D), 
		.SL(SL), 
		.SR(SR), 
		.S1(S1), 
		.S0(S0), 
		.QA(QA), 
		.QB(QB), 
		.QC(QC), 
		.QD(QD), 
		.CLR(CLR)
	);
	always begin CLK=~CLK; #10; end
	
	initial begin
		// Initialize Inputs
		CLK = 0;	A = 0;B = 0;C = 0;D = 0;SL = 0;SR = 0;S1 = 0;
		S0 = 0;CLR = 1;
#20;
CLR=0;#10;CLR=1;//It will put output in 0000 state
//parallel load  
A=1;B=0;C=1;D=0;S1=1;S0=1;// output={1010}  
#20
A=1;B=1;C=1;D=1;// output={1111}
#20
// Shift right
S1=0;S0=1;SR=0;// OUTPUT={0111}
#10
SR=1;//output={1011}
//Shift left
#20; S1=1;S0=0;SL=1;//output={0111}
#30
//CLEAR
CLR=0;#5; //OUTPUT={0000}
CLR=1;
//load 1000
A=1;B=0;C=0;D=0;S1=1;S0=1;
#10;
S1=0;S0=0;#50;// no change
	end
initial #250 $finish;
initial begin 
$monitor("%0d: S1:%b S0:%b ----> output:{%B,%b,%b,%b}",$time,S1,S0,QA,QB,QC,QD);
end      
endmodule