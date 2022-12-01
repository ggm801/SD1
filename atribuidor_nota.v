// O calculo para a nota será feito da seguinte forma:
// nota = 10 - módulo(ideal - sensor)

module atribuidor_nota (
	 clock,
	 enable,
	 sensor,
	 ideal,
	 nota
 );
 
	input clock, enable;
	input [3:0] sensor, ideal;
	
	output reg [3:0] nota;
	
	reg [3:0] n;
	
	always @* begin
		if (ideal >= sensor)
			n = 10 - (ideal - sensor);
		else
			n = 10 - (sensor - ideal);
	 end
	 
	 always @*
    begin
        case (n) 
        1 : nota = 4'b0001;
		  2 : nota = 4'd2;
        3 : nota = 4'd3;
        4 : nota = 4'd4;
        5 : nota = 4'd5;
        6 : nota = 4'd6;
        7 : nota = 4'd7;
        8 : nota = 4'd8;
        9 : nota = 4'd9;
        10: nota = 4'd10;
		  default: nota = 4'd11;

		endcase
	end

endmodule