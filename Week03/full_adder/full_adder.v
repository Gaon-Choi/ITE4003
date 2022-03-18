module full_adder(a, b, cin, sum, cout);
	input a, b, cin;
	output sum, cout;
	wire s1, c1, c2;
	
	half_adder ha1(a, b, s1, c1);
	half_adder ha2(cin, s1, sum, c2);
	or(cout, c1, c2);
	
endmodule

module half_adder(a, b, sum, cin);
	input a, b;
	output sum, cin;
	xor(sum, a, b);
	and(cin, a, b);
	
endmodule