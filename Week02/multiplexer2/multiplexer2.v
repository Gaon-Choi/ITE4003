module multiplexer2(a, b, sel, out);
	input a, b, sel;
	output out;
	reg out;
	
	always @ (a, b, sel) begin
		if (sel) out = b;
		else out = a;
	end
	
endmodule