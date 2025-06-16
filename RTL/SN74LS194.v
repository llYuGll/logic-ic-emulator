
module SN74LS194(
    input CLK,
    input A,
    input B,
    input C,
    input D,
    input SL,
    input SR,
    input S1,
    input S0,
    output reg QA,
    output reg QB,
    output reg QC,
    output reg QD,
    input CLR
    );

always @(posedge CLK, negedge CLR) begin
 if(~CLR) {QA,QB,QC,QD}<=4'b0000;
 else 
		case({S1,S0})
		2'b01: {QA,QB,QC,QD}<={SR,QA,QB,QC};  //shift reight operation
		2'b10: {QA,QB,QC,QD}<={QB,QC,QD,SL};   //shift lest operation 
		2'b11: {QA,QB,QC,QD}<={A,B,C,D}; //Parallel loading operation
		2'b00: {QA,QB,QC,QD}<={QA,QB,QC,QD};// no change,
// In Morris manos Book I saw that author never writes the no change operation in any case statements 
// I figured we dont have to as we are already mentioning output Reg type, it means by default if case statement
// has no matches it will preserve the last assignment. So we can always skip no change case as it is taken care by default		
		endcase
 
 
 end

endmodule
