module button_conditioner (
    input  wire clk,
    input  wire btn_raw,
    output wire btn_clean
);

	parameter MAX_COUNT = 1_000_000;
	wire btn_sync;
	
	sync_2ff sync_ff2 (
		.clk(clk),
		.async_in(btn_raw),
		.sync_out(btn_sync)
	);
	
	debounce #(.MAX_COUNT(MAX_COUNT)
		) deb (
		.clk(clk),
		.btn_in(btn_sync),
		.btn_out(btn_clean)
	);
	
endmodule