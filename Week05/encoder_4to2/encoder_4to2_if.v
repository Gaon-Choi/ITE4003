module encoder_4to2_if(i, e);
	input [3:0] i;
	output [1:0] e;
	reg [1:0] e;
	
	always @(*) begin
	if (i[0]) e = 2'b00;
	if (i[1]) e = 2'b01;
	if (i[2]) e = 2'b10;
	if (i[3]) e = 2'b11;
	end
endmodule
