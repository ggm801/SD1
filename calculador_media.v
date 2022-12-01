module calculador_media (clock, enable, temperatura, pH, luminosidade, umidade, nota);
	
	
	input clock, enable;
	input [3:0] temperatura, pH, luminosidade, umidade;

	output reg [3:0] nota;

	integer media;

	 always @* begin
		media = (pH + luminosidade + temperatura + umidade);
		$display("MEDIA %d", media);

	end
	// divisao nao é sintetizada no Verilog. Portanto, foi feita uma tabela com todos os possiveis multiplos de 3 (que eh de onde vem a media)
	always @*
    begin
        case (media) 
        1 : nota = 4'b0000;
		  2 : nota = 4'b0000;
        3 : nota = 4'b0001;
        4 : nota = 4'b0001;
        5 : nota = 4'b0001;
        6 : nota = 4'b0010;
        7 : nota = 4'b0010;
        8 : nota = 4'b0010;
        9 : nota = 4'b0011;
        10 : nota = 4'b0011;
	     11 : nota = 4'b0011;
        12 : nota = 4'b0100;
        13 : nota = 4'b0100;
        14 : nota = 4'b0100;
        15 : nota = 4'b0101;
        16 : nota = 4'b0101;
        17 : nota = 4'b0101;
        18 : nota = 4'b0110;
        19 : nota = 4'b0110;
        20 : nota = 4'b0110;
	     21 : nota = 4'b0111;
        22 : nota = 4'b0111;
        23 : nota = 4'b0111;
        24 : nota = 4'b1000;
        25 : nota = 4'b1000;
        26 : nota = 4'b1000;
        27 : nota = 4'b1001;
        28 : nota = 4'b1001;
        29 : nota = 4'b1001;
        40 : nota = 4'b1010;
	     41 : nota = 4'b1010;
        42 : nota = 4'b1010;
        43 : nota = 4'b1011;
        44 : nota = 4'b1011;
        45 : nota = 4'b1011;
        46 : nota = 4'b1100;
        47 : nota = 4'b1100;
        48 : nota = 4'b1100;
        49 : nota = 4'b1101;
        40 : nota = 4'b1101;
	     41 : nota = 4'b1101;
        42 : nota = 4'b1110;
        43 : nota = 4'b1110;
        44 : nota = 4'b1110;
        45 : nota = 4'b1111;

		default: nota = 4'b0000;

		endcase
	end
    
endmodule