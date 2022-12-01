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
	
	integer nota_integer;
	
	integer ideal_integer;
		always @ (ideal)
    ideal_integer = ideal;
	 
	 integer sensor_integer;
		always @ (sensor)
    sensor_integer = sensor;
	 
	 always @* begin
		if(ideal_integer - sensor_integer > 0)
			nota_integer = 10 - (ideal_integer - sensor_integer);
		else
			nota_integer = 10 + (ideal_integer - sensor_integer);
	 end
	 
	 always @*
    begin
        case (nota_integer) 
        1 : nota = 4'd1;
		  2 : nota = 4'd2;
        3 : nota = 4'd3;
        4 : nota = 4'd4;
        5 : nota = 4'd5;
        6 : nota = 4'd6;
        7 : nota = 4'd7;
        8 : nota = 4'd8;
        9 : nota = 4'd9;
        10: nota = 4'd10;
		  default: nota = 4'b0000;

		endcase
	end

endmodule