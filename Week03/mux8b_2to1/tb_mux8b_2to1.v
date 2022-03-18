module tb_mux8b_2to1();
	reg [7:0] a, b;
	reg		 sel;
	wire [7:0] out;
	
	mux8b_2to1_case U0 (a, b, sel, out);
	//mux8b_2to1_if U0 (a, b, sel, out);
	//mux8b_2to1_assign U0 (a, b, sel, out);
	
	initial begin
			a = 8'h42;	b = 8'h71;
	#20	a = 8'ha5;	b = 8'hbd;
	#20	a = 8'h18;	b = 8'h66;
	#20	a = 8'h35;	b = 8'h57;
	#20	a = 8'hb7;	b = 8'hc0;
	#20	a = 8'h15;	b = 8'h11;
	#20	a = 8'h07;	b = 8'h55;
	end
	
	initial begin
			sel = 1'b0;
	#50	sel = 1'b1;
	#40	sel = 1'b0;
	end
endmodule