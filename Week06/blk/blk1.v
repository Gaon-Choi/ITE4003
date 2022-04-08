module blk1(clk, d, q3);
	input clk;
	input d;
	output q3;
	reg q0, q1, q2, q3;
	
	always @(posedge clk) begin
		q0 = d;
		q1 = q0;
		q2 = q1;
		q3 = q2;
	end
endmodule
