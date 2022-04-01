module tb_encoder_4to2();
	reg [3:0] i;
	wire [1:0] e;
	
	// encoder_4to2_case u0(i, e);
	encoder_4to2_if_default u0(i, e);
	
	initial begin
			i = 4'b1111;
	#20	i = 4'b1110;
	#20	i = 4'b1101;
	#20	i = 4'b1100;
	#20	i = 4'b1011;
	#20	i = 4'b1010;
	#20	i = 4'b1001;
	#20	i = 4'b1000;
	#20	i = 4'b0111;
	#20	i = 4'b0110;
	#20	i = 4'b0101;
	#20	i = 4'b0100;
	#20	i = 4'b0011;
	#20	i = 4'b0010;
	#20	i = 4'b0001;
	#20	i = 4'b0000;
	end
endmodule

	