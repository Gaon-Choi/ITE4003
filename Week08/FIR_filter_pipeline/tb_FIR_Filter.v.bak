`timescale 1ns/1ps

module tb_FIR_Filter();
	
	reg CLK;
	reg RST;
	reg [11:0] Xin;
	
	wire [11:0] Yout;
	
	FIR_Filter f1(.clock(CLK), .reset(RST), .data_in(Xin), .data_out(Yout));
	
	initial CLK = 0;
	initial RST = 0;
	
	always #5 CLK = ~CLK;
		initial begin
			Xin = 0;
			#5;
			RST = !RST;
			#15;
			Xin = -3; #10;
			Xin =  1; #10;
			Xin =  0; #10;
			Xin = -2; #10;
			Xin = -1; #10;
			Xin =  4; #10;
			Xin = -5; #10;
			Xin =  6; #10;
			Xin =  0; #10;
		end
endmodule
