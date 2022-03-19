module tb_mux8b_4to1();
	reg [3:0] a, b, c, d;
	reg [1:0] sel;
	reg enable;
	wire [3:0] out;
	
	mux8b_4to1 U0 (a, b, c, d, sel, enable, out);
	
	initial begin
				a = 4'b0001; b = 4'b0010; c = 4'b0100; d = 4'b1000;
		#20	a = 4'b0010; b = 4'b0011; c = 4'b0101; d = 4'b1110;
		#20	a = 4'b1101; b = 4'b1000; c = 4'b1110; d = 4'b1001;
		#20	a = 4'b1111; b = 4'b1010; c = 4'b0110; d = 4'b1111;
		#20	a = 4'b0011; b = 4'b1110; c = 4'b0101; d = 4'b1010;
		#20	a = 4'b1001; b = 4'b0011; c = 4'b1100; d = 4'b1110;
		#20	a = 4'b1011; b = 4'b0111; c = 4'b0101; d = 4'b1001;
	end
	
	initial begin
			sel = 2'b00;
	#20	sel = 2'b01;
	#30	sel = 2'b10;
	#40	sel = 2'b11;
	end
	
	initial begin
			enable = 1'b1;
	#10	enable = 1'b0;
	end
endmodule