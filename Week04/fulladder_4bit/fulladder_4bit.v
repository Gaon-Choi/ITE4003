module fulladder_4bit(a, b, cin, sum, cout);
	input [3:0] a, b;
	input cin;
	output [3:0] sum;
	output cout;
	
	// use wire to store carry
	wire [2:0] c;
	
	// use four fulladder_1bit instances
	// each one uses its previous output to make its output
	
	/*
	integer K = 4;
	always @(*)
		for(i = 0; i < K; i=i+1)
		begin
			if(i == 0)
				begin
					fulladder_1bit F(a[0], b[0], cin, sum[0], c[0]);
				end
			if(i == K - 1)
				begin
					fulladder_1bit F(a[i], b[i], c[i-1], sum[i], cout);
				end
			else
				begin
					fulladder_1bit F(a[i], b[i], c[i-1], sum[i], c[i]);
				end
		end
	*/
	
	fulladder_1bit F1(a[0], b[0], cin, sum[0], c[0]);
	fulladder_1bit F2(a[1], b[1], c[0], sum[1], c[1]);
	fulladder_1bit F3(a[2], b[2], c[1], sum[2], c[2]);
	fulladder_1bit F4(a[3], b[3], c[2], sum[3], cout);

endmodule

module fulladder_1bit(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;
    wire s1, c1, c2;
    
    xor g1(s1, a, b);
    and g2(c1, a, b);
    and g3(c2, s1, cin);
    xor g4(sum, s1, cin);
    xor g5(cout, c1, c2);
    
endmodule
