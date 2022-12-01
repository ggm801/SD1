`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module estufa_tb;

    reg clock, reset, enable;
	 reg [3:0] tipo_planta, temperatura, pH, luminosidade, umidade;
    wire [6:0] display_media, display_temperatura, display_pH, display_luminosidade, display_umidade;

    // duration for each bit = 20 * timescale = 20 * 1 ns  = 20ns
    localparam period = 20;  

    controlador_estufa UUT (
		.clock (clock),
		.enable (enable),
		.tipo_planta (tipo_planta),
		.temperatura (temperatura),
		.pH (pH),
		.reset (reset),
		.luminosidade (luminosidade),
		.umidade (umidade),
		.display_media (display_media),
		.display_temperatura (display_temperatura),
		.display_pH (display_pH),
		.display_luminosidade (display_luminosidade),
		.display_umidade (display_umidade)
	 );
    
   initial begin
		clock = 0;
		reset = 0;
		enable = 0;
	end
	
	always #5 clock =! clock;
	
	initial begin
		reset = 1;
		#period;
		reset = 0;
		
		tipo_planta = 0000;
		temperatura = 4'd6;
		umidade = 1000;
		luminosidade = 1000;
		pH = 4'd6;
		enable = 1;
	
		#100000;
		
		reset = 1;
		#period;
		reset = 0;
		
		tipo_planta = 0001;
		temperatura = 4'd5;
		umidade = 0001;
		luminosidade = 0100;
		pH = 4'd4;
		enable = 1;
				
		#100000;
		
		reset = 1;
		#period;
		reset = 0;
		
		tipo_planta = 0010;
		temperatura = 4'd6;
		umidade = 1000;
		luminosidade = 1000;
		pH = 4'd6;
		enable = 1;
	
		#100000;
		
		reset = 1;
		#period;
		reset = 0;
		
		tipo_planta = 0011;
		temperatura = 4'd6;
		umidade = 1000;
		luminosidade = 1000;
		pH = 4'd6;
		enable = 1;
				
		#100000;
		
		
	$stop;
	end
	
endmodule