
module SN74LS181(
    input [3:0] A,
    input [3:0] B,
    input M,
    input Cn,
    output [3:0] F,
    output AeqB,
    output Cn4,
    input [3:0] S
    );
//this is 4 bit ALU IC , find more info in DOC section, ill avoid explaination here as everything is mentioned in DOC	 
reg [3:0] temp_Fl;//logical 
reg [4:0] temp_Fa;//arthmatic, extra bit to take care of carry 

reg temp_Cn4, temp_AeqB;

always @(*) begin
	if(M) begin // logical operations are set with M=1
		case(S)
			   4'b0000: temp_Fl = ~A;
            4'b0001: temp_Fl = ~(A|B);
            4'b0010: temp_Fl = (~A)&B;
            4'b0011: temp_Fl = 4'b0000;
            4'b0100: temp_Fl = ~(A&B);
            4'b0101: temp_Fl = ~B;
            4'b0110: temp_Fl = A^B;
            4'b0111: temp_Fl = A&(~B);
            4'b1000: temp_Fl = (~A)|B;
            4'b1001: temp_Fl = ~(A^B);
            4'b1010: temp_Fl = B;
            4'b1011: temp_Fl = A&B;
            4'b1100: temp_Fl = 4'b1111;
            4'b1101: temp_Fl = A|(~B);
            4'b1110: temp_Fl = A|B;
            4'b1111: temp_Fl = A;
				default: temp_Fl=0;
		endcase
		temp_Cn4=1'b1; // no need to set carry out in logicl operations,rem Cn4 is negative logic
			end
	else begin//arithmatic operation
		case(S)
		  4'b0000:temp_Fa = A+ ~Cn;                          
        4'b0001:temp_Fa= A + B + ~Cn;                      
        4'b0010:temp_Fa= A + (~B) + ~Cn;                   
        4'b0011:temp_Fa= 0 + ~Cn - 1;                      
        4'b0100:temp_Fa= A + (A & (~B)) + ~Cn;             
        4'b0101:temp_Fa= (A + B) + (A & (~B)) + ~Cn;       
        4'b0110:temp_Fa= A + (~B) + ~Cn - 1;               
        4'b0111:temp_Fa= (A & (~B)) + ~Cn - 1;             
        4'b1000: temp_Fa= A + (A & B) + ~Cn;                
        4'b1001:temp_Fa = A + B + ~Cn;                     
        4'b1010:temp_Fa = (A + (~B)) + (A & B) + ~Cn;     
        4'b1011:temp_Fa= (A & B) + ~Cn - 1;                
        4'b1100:temp_Fa= A + A + ~Cn;                      
        4'b1101:temp_Fa= (A + B) + A + ~Cn;                
        4'b1110:temp_Fa= (A + (~B)) + A + ~Cn;             
        4'b1111:temp_Fa= A + ~Cn - 1;                      
        default: temp_Fl=0;
		endcase
			temp_Cn4= (temp_Fa[4])?0:1; // negative logic
			end
	
	end	
// now there is some confuusion with AeqB, for some reasons when i checked on breadbord it does not go high
//when A=B , after some online hepl it seems it is High if F=4'b1111; I have zero idea of why this is like this
assign F= (M)? temp_Fl:temp_Fa[3:0];
assign Cn4=temp_Cn4;
always @(F)begin if (F==4'b1111) AeqB=1;else AeqB=0;end
// I dont see any use to give testbench for this IC as it would be mechanical waste of time to check each operation
// I have checked for any logaical error multiple times, if you find some plz suggest in pull request
endmodule

