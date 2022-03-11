module multiplexer3(a, b, sel, out);
	input a, b, sel;
	output out;
	wire out1, out2, nsel;
	
	and g1(out1, a, nsel), g2(out2, b, sel);
	or  g3(out, out1, out2);
	not g4(nsel, sel);
	
endmodule