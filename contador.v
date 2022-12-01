module contador (
	clock,
	reset,
	fim
);

	input clock, reset;

	output reg fim;

	reg [3:0] contagem;

	always @ (posedge clock) begin
		if(reset)
			contagem <= 0;
		else begin
			if (contagem == 4'b1111)
			fim <= 1;
			else
			contagem <= contagem + 1;
		end
	end

endmodule