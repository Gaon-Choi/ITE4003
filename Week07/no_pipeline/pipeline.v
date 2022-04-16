module pipeline(a, b, c, d, reset, clock, y);

// input signals
input[2:0] a, b, c, d;
input clock, reset;

// output signals
output[7:0] y;
reg[7:0] y;

// register
reg[3:0] temp_0, temp_1;

// function by c
always @(posedge clock or negedge reset)
begin
	if(!reset) begin
		temp_0 <= 4'b0;
		temp_1 <= 4'b0;
		y <= 8'b0;
	end
	
	else begin
		temp_0[3:0] <= {1'b0, a[2:0]} + {1'b0, b[2:0]};
		temp_1[3:0] <= {1'b0, c[2:0]} + {1'b0, d[2:0]};
		y <= temp_0 * temp_1;
	end
end

endmodule
