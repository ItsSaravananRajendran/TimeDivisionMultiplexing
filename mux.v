module mux(out , d0 ,d1,d2,d3,sel);
	output [3:0] out;
	input[3:0] d0 ;
	input[3:0] d1;
	input[3:0] d2;
	input[3:0] d3;
	input[1:0] sel;

	wire [3:0] d0;
	wire [3:0] d1;
	wire [3:0] d2;
	wire [3:0] d3;	
	wire [1:0] sel;
	reg [3:0] out;
	
	always @ (sel[0] or ~sel[0]) 
	begin
		if(sel==0)
			out = d0;
		if(sel==1)
			out = d1;
		if(sel==2)
			out = d2;
		if(sel==3)
			out = d3;
	end
endmodule
	
