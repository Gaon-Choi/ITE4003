module tb_mealy_fsm();
	reg clk, rst, din_bit;
	wire dout_bit;
	
	mealy_fsm u0(clk, rst, din_bit, dout_bit);
	
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
		din_bit = 0;
		#30 din_bit = 0;
		#20 din_bit = 1;
		#20 din_bit = 1;
		#20 din_bit = 0;
		#20 din_bit = 0;
		#20 din_bit = 1;
		#20 din_bit = 1;
		#20 din_bit = 1;
		#20 din_bit = 0;
		#20 din_bit = 1;
		#20 din_bit = 1;
		#20 din_bit = 0;
		#20 din_bit = 1;
		#100 $stop;
	end
endmodule
