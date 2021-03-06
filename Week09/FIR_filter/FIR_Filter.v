`timescale 1ns/1ps

module FIR_Filter(clock, reset, data_in, data_out);
	input clock, reset;
	input signed [11:0] data_in;
	output signed [11:0] data_out;
	
	reg signed[11:0] data_out;
	reg signed[11:0] p3, p2, p1;
	
	always @(posedge clock or negedge reset) begin
		if(!reset) begin
			p3 <= 12'd0;
			p2 <= 12'd0;
			p1 <= 12'd0;
			data_out <= 12'd0;
		end
		
		else begin
			p3 <= data_in;
			p2 <= p3;
			p1 <= p2;
			data_out <= (p3*2 + p2*4) + p1*6;
		end
	end
endmodule
