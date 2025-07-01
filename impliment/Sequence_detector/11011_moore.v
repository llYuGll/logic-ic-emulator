   module moore_11011 (
    input clk,      
    input x,        
    output y        
);
    wire QA, QB, QC;// flipflops output A- MSB
    wire DA, DB, DC;
	 
    wire w1, w2;
    and (w1, ~QA, QB, QC, ~x);   
    and (w2, QA, ~QB, ~QC, x);    
    or (DA, w1, w2);           
    wire w3, w4;
    and (w3, QC, x, ~QA);        
    and (w4, QC, x, ~QB);        
    or (DB, w3, w4);           
    assign DC=x;                

    d_ff inst_A (.clk(clk), .d(DA), .q(QA));
    d_ff inst_B(.clk(clk), .d(DB), .q(QB));
    d_ff inst_C (.clk(clk), .d(DC), .q(QC));  
    and (y, QA, ~QB, QC);          
endmodule