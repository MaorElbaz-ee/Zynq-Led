`timescale 1ns / 1ps
module tb_button_conditioner;
	
    parameter MAX_COUNT = 10;

	reg clk;
	initial clk = 0;
	always #5 clk = ~clk;

	reg btn_raw = 0;
	wire btn_clean;
	integer  i;

	button_conditioner #(.MAX_COUNT(MAX_COUNT)
		) dut (
		.clk(clk),
		.btn_raw(btn_raw),
		.btn_clean(btn_clean)
	);


	initial begin
			
		for(i = 1; i < 10; i = i + 2) begin
			btn_raw = 1;
			repeat(i) @(negedge clk);
			btn_raw = 0;
			repeat(i) @(negedge clk);	
		end
		btn_raw = 1;
		repeat(20) @(negedge clk);
		
		for(i = 1; i < 10; i = i + 2) begin
			btn_raw = 0;
			repeat(i) @(negedge clk);
			btn_raw = 1;
			repeat(i) @(negedge clk);	
		end
		btn_raw = 0;
		repeat(20) @(negedge clk);
		$finish;
	end

endmodule