`timescale 1ns/1ps

module FIR_Filter_pipe(clock, reset, data_in, data_out);
	input clock, reset;
	input signed [11:0] data_in;
	output signed [11:0] data_out;
	
	reg signed [11:0] data_out;
	reg signed [11:0] p3, p2, p1;
	reg signed [11:0] t3, t2, t1;
	
	always @(posedge clock or negedge reset) begin
		if(!reset) begin
			p3 <= 12'd0;
			p2 <= 12'd0;
			p1 <= 12'd0;
			data_out <= 12'd0;
			
			t1 <= 12'd0;
			t2 <= 12'd0;
			t3 <= 12'd0;
		end
	
		else begin
			p3 <= data_in;
			p2 <= p3;
			p1 <= p2;
			t3 <= p3 * 2;
			t2 <= p2 * 4;
			t1 <= p1 * 6;
			data_out <= t1 + (t2 + t3);
		end
	end
endmodule
