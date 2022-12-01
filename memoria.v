//ROM contendo temperatura, umidade, pH e luminosidade ideais das seguintes plantas em ordem 
//(as medidas são representativas, os dados ideais sobre as plantas nao foram estudados): 
// alface
// cactus
// samabaia
// manjericao
// orquidea
// alecrim
// capim
// grama
// rosa
// laranja
// limao
// uva
// maça
// abacaxi
// pera
// melancia

module memoria (
	clock,
	enable,
	tipo_planta,
	temperatura,
	umidade,
	luminosidade,
	pH
);
	
	input clock, enable;
	input [3:0] tipo_planta;
	
	output reg [3:0] temperatura, pH, luminosidade, umidade;
	
	
	always @*
	begin
		case(tipo_planta)
		  4'b0000 : temperatura = 4'd6 ; 
        4'b0001 : temperatura = 4'd10 ; 
        4'b0010 : temperatura = 4'd6 ; 
        4'b0011 : temperatura = 4'd5 ; 
        4'b0100 : temperatura = 4'd4 ; 
        4'b0101 : temperatura = 4'd3 ; 
        4'b0110 : temperatura = 4'd6 ; 
        4'b0111 : temperatura = 4'd7 ; 
        4'b1000 : temperatura = 4'd5 ; 
        4'b1001 : temperatura = 4'd6 ;
        4'b1010 : temperatura = 4'd8 ; 
        4'b1011 : temperatura = 4'd8 ; 
        4'b1100 : temperatura = 4'd6 ; 
        4'b1101 : temperatura = 4'd7 ; 
        4'b1110 : temperatura = 4'd8 ; 
        default : temperatura = 4'd0 ; 
		endcase
		
		case(tipo_planta)
		  4'b0000 : pH = 4'd6 ; 
        4'b0001 : pH = 4'd9 ; 
        4'b0010 : pH = 4'd5 ; 
        4'b0011 : pH = 4'd5 ; 
        4'b0100 : pH = 4'd4 ; 
        4'b0101 : pH = 4'd6 ; 
        4'b0110 : pH = 4'd5 ; 
        4'b0111 : pH = 4'd4 ; 
        4'b1000 : pH = 4'd3 ; 
        4'b1001 : pH = 4'd8 ; 
        4'b1010 : pH = 4'd5 ; 
        4'b1011 : pH = 4'd5 ; 
        4'b1100 : pH = 4'd5 ; 
        4'b1101 : pH = 4'd5 ; 
        4'b1110 : pH = 4'd5 ; 
        default : pH = 4'd0 ; 
		endcase
		
		case(tipo_planta)
		  4'b0000 : umidade = 4'd8 ; 
        4'b0001 : umidade = 4'd2 ; 
        4'b0010 : umidade = 4'd8 ; 
        4'b0011 : umidade = 4'd6 ; 
        4'b0100 : umidade = 4'd7 ; 
        4'b0101 : umidade = 4'd5 ; 
        4'b0110 : umidade = 4'd5 ; 
        4'b0111 : umidade = 4'd5 ; 
        4'b1000 : umidade = 4'd6 ; 
        4'b1001 : umidade = 4'd7 ; 
        4'b1010 : umidade = 4'd8 ; 
        4'b1011 : umidade = 4'd8 ; 
        4'b1100 : umidade = 4'd8 ; 
        4'b1101 : umidade = 4'd8 ; 
        4'b1110 : umidade = 4'd9 ; 
        default : umidade = 4'd0 ; 
		endcase
		
		case(tipo_planta)
		  4'b0000 : luminosidade = 4'd8 ;
        4'b0001 : luminosidade = 4'd9 ;
        4'b0010 : luminosidade = 4'd7 ;
        4'b0011 : luminosidade = 4'd8 ;
        4'b0100 : luminosidade = 4'd7 ;
        4'b0101 : luminosidade = 4'd6 ;
        4'b0110 : luminosidade = 4'd6 ;
        4'b0111 : luminosidade = 4'd6 ;
        4'b1000 : luminosidade = 4'd6 ;
        4'b1001 : luminosidade = 4'd7 ;
        4'b1010 : luminosidade = 4'd8 ;
        4'b1011 : luminosidade = 4'd6 ;
        4'b1100 : luminosidade = 4'd8 ;
        4'b1101 : luminosidade = 4'd7 ;
        4'b1110 : luminosidade = 4'd7 ;
        default : luminosidade = 4'd0 ;
		endcase
		
	end
	
endmodule