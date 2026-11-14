`timescale 1ns / 1ps
module tb_debounce;
	
    parameter MAX_COUNT = 10;

	reg clk;
	initial clk = 0;
	always #5 clk = ~clk;

	reg btn_in = 0;
	wire btn_out;
	integer  i;

	debounce #(.MAX_COUNT(MAX_COUNT)
		) dut (
		.clk(clk),
		.btn_in(btn_in),
		.btn_out(btn_out)
	);


	initial begin
			
		for(i = 1; i < 10; i = i + 2) begin
			btn_in = 1;
			repeat(i) @(negedge clk);
			btn_in = 0;
			repeat(i) @(negedge clk);	
		end
		btn_in = 1;
		repeat(20) @(negedge clk);
		
		for(i = 1; i < 10; i = i + 2) begin
			btn_in = 0;
			repeat(i) @(negedge clk);
			btn_in = 1;
			repeat(i) @(negedge clk);	
		end
		btn_in = 0;
		repeat(20) @(negedge clk);
		$finish;
	end

endmodule