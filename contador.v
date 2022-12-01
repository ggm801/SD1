module contador (
	clock,
	reset,
	conta,
	fim
);

	input clock, conta, reset;

	output reg fim;

	integer contagem;

	always @ (posedge clock) begin
		if(reset)
			contagem <= 0;
		else
			if(conta)
				contagem <= contagem + 1;
		
		if(contagem == 40000) begin
			fim <= 1;
			contagem <= 0;
		end
		
	end

endmodule