module multiplexer1(a, b, sel, out);
	input a, b, sel;
	output out;
	
	assign out = sel ? b : a;
	
endmodule