module tb_fsm();
	reg clk, rst, bypss;
	wire [1:0] out;
	
	fsm u0(clk, rst, bypss, out);
	initial begin
		rst = 1;
		#15 rst = 0;
		#25 rst = 1;
	end
	
	initial begin
		clk = 0;
		forever
		#10 clk = ~clk;
	end
	
	initial begin
		bypss = 0;
		#100 bypss = 1;
		#100 bypss = 0;
		#100 $stop;
	end
endmodule
