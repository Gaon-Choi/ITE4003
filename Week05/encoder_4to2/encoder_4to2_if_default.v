module encoder_4to2_if_default(i, e);
	input [3:0] i;
	output [1:0] e;
	reg [1:0] e;
	
	always @(*) begin
	if (i[0]) e = 2'b00;
	else if (i[1]) e = 2'b01;
	else if (i[2]) e = 2'b10;
	else if (i[3]) e = 2'b11;
	else e = 2'bxx;
	end
endmodule
