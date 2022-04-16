`timescale 1ns/1ps

module tb_no_pipeline();

reg reset, clock;

reg[2:0] a, b, c, d;
wire[7:0] y;

no_pipeline Np1(.a(a), .b(b), .c(c), .d(d), .y(y), .clock(clock), .reset(reset));

initial begin
	clock = 1'b1; reset = 1'b1;
	a = 3'd1;	b = 3'd2;
	c = 3'd3;	d = 3'd4;
	#400 $stop;
end

always begin
	#20 clock = !clock;
end

always begin
	#40 a = a + 3'b1; b = b + 3'b1; c = c + 3'b1; d = d + 3'b1;
end

endmodule
