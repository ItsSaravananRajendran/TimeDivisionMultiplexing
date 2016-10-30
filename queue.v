module queue(out, r_en , w_en ,clk,en, in1);
	reg [3:0] q1 ;
	reg [3:0] q2 ;
	reg [3:0] q3 ;
	output	reg [3:0] out;
	input  [3:0] in1;
	input r_en;
	input w_en;
	input en;
	input clk;
	wire clk, en , w_en, r_en ;
	wire  [3:0]in1;	

	always @ (posedge clk && en)  begin
		if(w_en==1) begin
			q1<=q2;
			q2<=q3;
			q3<=in1;	
		end
		if(r_en == 1 ) begin
			out <= q1;
			q1<=q2;
			q2<=q3;
			q3<=in1;
		end 
	end
	always @(en==0) begin
		 q1 <= 4'b0000;
		 q2 <= 4'b0000;
		 q3 <= 4'b0000;
	end
endmodule
		
	
