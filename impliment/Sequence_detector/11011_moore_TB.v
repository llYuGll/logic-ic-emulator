
module moore11011_TB;

	// Inputs
	reg clk;
	reg x;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	moore_11011 uut (
		.clk(clk), 
		.x(x), 
		.y(y)
	);

	
always #5 clk=~clk;
	initial begin
		x = 0;clk = 0;
		#8;
		x=0;#2;
		#8;
		x=0;#2;
		#8;
		x=1;#2;
		#8;
		x=1;#2;
		#8;
		x=0;#2;
		#8;
		x=1;#2;
		#8;
		x=1;#2;// output=1 next clock edge
		#8;
		x=0;#2;
		#8;
		x=1;#2;
		#8;
		x=1;#2;// output=1 next clock edge
		#8;
		x=0;#2;
		#8;
		x=0;#2;
		#8;
		x=0;#2;
		#8;
		x=1;#2;
		#8;
		x=1;#2;
		#8;
		x=0;#2;
		#8;
		x=1;#2;
		#8;
		x=1;#2; // output=1 next clock
		#8;
     
	end
initial begin $monitor(" %0d: output:%b",$time,y); end     
endmodule

