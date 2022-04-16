`timescale 1ns / 1ps

module no_pipeline(a, b, c, d, reset, clock, y);

input [2:0] a, b, c, d;
input clock, reset;

// Output Signals
output [7:0] y;
reg [7:0] y;

// Register
reg [3:0] temp_0, temp_1;

// Function by Clock
always @(posedge clock or negedge reset) begin
	// if falling-edge, reset all register
	if(!reset) begin
		y <= 8'd0;
	end
	
	// if rising-edge, do function
	else begin
		y <= {{1'b0, a[2:0]} + {1'b0, b[2:0]}} * {{1'b0, c[2:0]} + {1'b0, d[2:0]}};
	end
end
endmodule
