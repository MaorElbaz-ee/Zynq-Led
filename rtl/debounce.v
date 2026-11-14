module debounce (
    input  wire clk,
    input  wire btn_in,
    output reg  btn_out = 1'b0
);
    parameter MAX_COUNT = 1_000_000;
    reg [19:0] count = 0;

    always @(posedge clk) begin
        if (btn_in == btn_out || count == MAX_COUNT - 1) begin
            count   <= 0;
            btn_out <= btn_in;
        end else begin
            count <= count + 1;
        end
    end
endmodule