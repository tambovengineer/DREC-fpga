module master_spi (
	input clk,
	
	input miso,
	output mosi,
	output clk_spi,
	output ss
);

reg [3:0]en_cnt = 0;
reg [3:0]div_cnt = 0;
reg spi_enable;
reg [7:0]hex_cnt = 0;
always @(posedge clk) begin
	if (en_cnt > 7)
		spi_enable <= 0;
	else
		spi_enable <= 1;

	en_cnt <= en_cnt + 1;
	div_cnt <= div_cnt + 1;
	
	if (div_cnt == 0)
		hex_cnt <= hex_cnt + 1;
end



reg [7:0]shift_register;
always @(posedge clk) begin
	if (spi_enable)
		shift_register <= {shift_register[6:0], miso};
	else
		shift_register <= hex_cnt;
end

assign mosi = shift_register[7];
and(clk_spi, clk, spi_enable);
assign ss = 0;
endmodule
