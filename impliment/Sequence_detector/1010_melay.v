module sequence_detector_a(
    input x,
    input clk,
    output y
    );
// as their are lot of predefined input paramenters in our 7474 D flip flop IC, i am creating a smaller module here which 
// replicates the behaviour of 7474 with single D ff
// i have attached d_ff that i am using 
// also as explained in read module i ll alternate between Moore and mealey FSMs 
// aslo here overlapping sequence will also be detected,
// For this i am using mealay
wire DA,DB,QA,QB;//inputs and outputs of D flip flops
wire x_b,QB_b,inp1,inp2,inp3; // used in one of ghe dffs inputs,and temporary variableds inp1,2,3
// i have explained how i have arrived at this design in brief inside sequence_dector module it is very interesting take alook 
not(x_b,x);
not (QB_b,QB);
and (inp1,x_b,QB);
and(inp2,QA,QB_b);
and(inp3,inp2,x);
or (DA,inp3,inp1);
assign DB=x;
d_ff inst1( .clk(clk),.d(DA), .q(QA));
d_ff inst2( .clk(clk),.d(DB), .q(QB));

wire w1;
and (w1,QB,QA);
and (y,x_b,w1);

// this completes detection of 1010 sequence , i have used gate level modelling so it can be physically implimented using this code 
// if necessary

endmodule

