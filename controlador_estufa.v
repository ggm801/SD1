module controlador_estufa (
	clock,
	enable,
	tipo_planta,
	temperatura,
	pH,
	reset,
	luminosidade,
	umidade,
	display_media,
	display_temperatura,
	display_pH,
	display_luminosidade,
	display_umidade
);
	
	input clock, enable, reset;
	input [3:0] temperatura, pH, tipo_planta, luminosidade, umidade;
	
	output [6:0] display_media, display_temperatura, display_pH, display_luminosidade, display_umidade;
	
	wire [3:0] ideal_temperatura, ideal_umidade, ideal_luminosidade, ideal_pH, nota_temperatura, nota_pH, nota_luminosidade, nota_umidade, media;
	wire s_zera, s_fim, s_reg;
	wire [3:0] s_media;
		
	atribuidor_nota NOTATEMPERATURA (
	
		.clock (clock),
		.enable (enable),
		.sensor(temperatura),
		.ideal(ideal_temperatura),
		.nota (nota_temperatura)
		);
		
	atribuidor_nota NOTAUMIDADE (
	
		.clock (clock),
		.enable (enable),
		.sensor(umidade),
		.ideal(ideal_umidade),
		.nota (nota_umidade)
		);
		
	atribuidor_nota NOTALUMINOSIDADE (
	
		.clock (clock),
		.enable (enable),
		.sensor(luminosidade),
		.ideal(ideal_luminosidade),
		.nota (nota_luminosidade)
		);
	
	atribuidor_nota NOTAPH (
	
		.clock (clock),
		.enable (enable),
		.sensor(pH),
		.ideal(ideal_pH),
		.nota (nota_pH)
		);
		
	calculador_media CM(
		.clock (clock),
		.enable (enable),
		.temperatura (nota_temperatura),
		.umidade (nota_umidade),
		.luminosidade (nota_luminosidade),
		.pH (nota_pH),
		
		.nota (media)
	);
	
	memoria M(
		.clock (clock),
		.enable (enable),
		.tipo_planta (tipo_planta),
		.temperatura (ideal_temperatura),
		.luminosidade (ideal_luminosidade),
		.umidade (ideal_umidade),
		.pH (ideal_pH)
	);
	
  display7seg MED(
		.nota (s_media),
		.s_nota (display_media)
  );
  
  display7seg TEMP(
		.nota (nota_temperatura),
		.s_nota (display_temperatura)
  );
  
  display7seg PH(
		.nota (nota_pH),
		.s_nota (display_pH)
  );
  
  display7seg LUMI(
		.nota (nota_luminosidade),
		.s_nota (display_luminosidade)
  );
  
  display7seg UMI(
		.nota (nota_umidade),
		.s_nota (display_umidade)
  );
  
  contador CONT(
	.clock(clock),
	.reset(s_zera),
	.fim(s_fim),
	.conta(s_conta)
  );
  
  registrador REG(
		.Q(s_media),
		.clock(clock),
		.reset(s_zera),
		.D(media),
		.enable(s_reg)
  );
  
  unidade_controle UC(
    .clock(clock),
	 .reset(reset),
    .conta(s_conta),
	 .zera(s_zera),
	 .fim_contador(s_fim),
	 .registra(s_reg)
  );
  
  always @* begin
	  $display("SENS pH %d", pH);
	  $display("SENS temperatura %d", temperatura);
	  $display("SENS luminosidade %d", luminosidade);
	  $display("SENS umidade %d", umidade);
	  
	  $display("IDEAL pH %d", ideal_pH);
	  $display("IDEAL temperatura %d", ideal_temperatura);
	  $display("IDEAL luminosidade %d", ideal_luminosidade);
	  $display("IDEAL umidade %d", ideal_umidade);
	  
	  $display("NOTA pH %d", nota_pH);
	  $display("NOTA temperatura %d", nota_temperatura);
	  $display("NOTA luminosidade %d", nota_luminosidade);
	  $display("NOTA umidade %d", nota_umidade);
  end
  
endmodule