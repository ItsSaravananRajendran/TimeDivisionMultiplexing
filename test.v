module test ;
	reg clk=0;
	wire [3:0] read;
	reg w0,w1,w2,w3;
	reg en=0;
	wire[3:0] data;
	wire [3:0] out0;
	wire [3:0] out1;
	wire [3:0] out2;
	wire [3:0] out3;
	reg [3:0] in0;
	reg [3:0] in1;
	reg [3:0] in2;
	reg [3:0] in3;
	wire [1:0] sel;
	reg reset =0;
	wire [3:0] re;
	wire [6:0] word;

	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0,test);
		#1 en<=1;
		   reset<=1;
		#1 w0 <= 1;
		   w1 <= 1; 
		   w2 <= 1;
		   w3 <= 1;			
		#2 in0 <= 4'b0101;
		   in1 <= 4'b0000;
		   in2 <= 4'b1000;
		   in3 <= 4'b1010;
		   reset<=0;
		#2 in0 <= 4'b0100;
		   in1 <= 4'b1111;
		   in2 <= 4'b1011;
		   in3 <= 4'b1101;
		#2 in0 <= 4'b1111;
		   in1 <= 4'b1010;
		   in2 <= 4'b1110;
		   in3 <= 4'b1011;
		#1 w0 <= 0;
		   w1 <= 0;
		   w2 <= 0;
		   w3 <= 0;
		#50 $finish;
	end

	always #1 clk =~clk;
	

	counter cntr (sel,clk,reset);
	decoder decod(read,sel);
	queue q0 (out0 ,read[0],w0,clk,en,in0);
	queue q1 (out1 ,read[1],w1,clk,en,in1);
	queue q2 (out2 ,read[2],w2,clk,en,in2);
	queue q3 (out3 ,read[3],w3,clk,en,in3);
  	mux mu(data , out0,out1,out2,out3,sel);	
	encoder e(word ,data);

endmodule
