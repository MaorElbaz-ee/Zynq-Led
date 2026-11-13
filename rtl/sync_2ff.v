module sync_2ff (
	input wire clk,
	input wire async_in,
	output wire sync_out
);

	reg ff1_out, ff2_out;
	assign sync_out = ff2_out;
	always @(posedge clk) begin
		ff2_out <= ff1_out;
		ff1_out <= async_in;
	end
		
endmodule
