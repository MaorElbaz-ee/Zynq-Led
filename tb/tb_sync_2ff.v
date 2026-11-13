`timescale 1ns / 1ps
module tb_sync_2ff;

	reg clk;
	initial clk = 0;
	always #5 clk = ~clk;

	reg async_in;
	wire sync_out;

	sync_2ff dut (
		.clk(clk),
		.async_in(async_in),
		.sync_out(sync_out)
	);

	initial begin
		async_in = 0;
		repeat(2) @(negedge clk);
		async_in = 1;
		repeat(5) @(posedge clk);
		$finish;
	end

endmodule