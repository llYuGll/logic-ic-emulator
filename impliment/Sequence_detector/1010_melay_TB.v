
module detector_TB;

	// Inputs
	reg x;
	reg clk;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	sequence_detector_a uut (
		.x(x), 
		.clk(clk), 
		.y(y)
	);

always #5 clk=~clk;
	initial begin
		// Initialize Inputs
		x = 0;clk = 0;
		#8;
		x=0;#2;
		#8;
		x=0;#2;
		#8;
		x=1;#2;
		#8;
		x=0;#2;
		#8;
		x=1;#2;
		#8;
		x=0;#2;// output=1 t=58
		#8;
		x=1;#2;
		#8;
		x=0;#2;// output=1 t=78
		#8;
		x=1;#2;
		#8;
		x=1;#2;
		#8;
		x=0;#2;
		#8;
		x=1;#2;
		#8;
		x=0;#2;// output=1 t=128
     
	end
initial begin $monitor(" %0d: output:%b",$time,y); end     
endmodule

