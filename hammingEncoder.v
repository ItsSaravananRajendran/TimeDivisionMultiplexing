module encoder( word,data);

	input [3:0]data;
	output [6:0] word;
 
	assign 	 word[6] = data[2] + data[1] + data[0];
 	assign	 word[5] = data[3] + data[1] + data[0];
	assign	 word[4] = data[3] + data[2] + data[0];
	assign	 word[3] = data[3];
	assign	 word[2] = data[2];
	assign	 word[1] = data[1];
	assign	 word[0] = data[0];

endmodule
