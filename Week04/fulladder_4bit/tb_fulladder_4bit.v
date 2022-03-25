module tb_fulladder_4bit;
	parameter N = 4;
	reg [N-1:0] a;
	reg [N-1:0] b;
	reg c_in;
	
	wire [3:0] sum;
	wire c_cout;
	
	fulladder_4bit fa4(
		.a(a),
		.b(b),
		.cin(c_in),
		.sum(sum),
		.cout(c_cout)
	);
	
	integer i;
	
	// Test start
	initial
	begin
	
		// when cin == 0
		c_in = 1'b0;
		for(i=0; i<2**(2*N); i=i+1)
		begin
			{b, a} = i;
			#10;
			$display("a=", a, " b=", b, " sum=", sum, " cout=", c_cout);
		end
	
		// when cin == 1
		c_in = 1'b1;
		for(i=0; i<2**(2*N); i=i+1)
		begin
			{b, a} = i;
			#10;
			$display("a=", a, " b=", b, " sum=", sum, " cout=", c_cout);
		end
	end
endmodule
