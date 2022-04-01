module encoder_4to2_case(i, e);
	input [3:0] i;
	output [1:0] e;
	reg [1:0] e;
	
	always @(*) begin
	case(i)
	4'b0001: e = 2'b00;
	4'b0010: e = 2'b01;
	4'b0100: e = 2'b10;
	4'b1000: e = 2'b11;
	endcase
	end
endmodule
