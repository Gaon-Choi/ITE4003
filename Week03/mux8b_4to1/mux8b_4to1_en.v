module mux8b_4to1_en(a, b, c, d, sel, enable, out);
	input a[3:0], b[3:0], c[3:0], d[3:0];
	input sel[1:0];
	input enable;
	
	output out[4:0];
	reg out[4:0];
	
	
	always @(a, b, sel) begin
		if (!enable)
			case sel:
				2'b00 : out = a;
				2'b01 : out = b;
				2'b10 : out = c;
				2'b11 : out = d;
			endcase
		else
			out = 4'b0000;
	end
	
endmodule