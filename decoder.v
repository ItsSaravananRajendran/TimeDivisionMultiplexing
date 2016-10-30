module decoder(out,s);

 output [3:0]out;
 input [1:0]s;
 wire [1:0]s;
 input en;

 assign out[0] = (~s[0])&(~s[1]);
 assign out[1] = (~s[1])&(s[0]);
 assign out[2] = s[1] & (~s[0]);
 assign out[3] = s[0] & s[1];

 endmodule
