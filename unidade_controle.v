module unidade_controle
(
    clock,
	 reset,
    conta,
	 zera,
	 fim_contador,
	 registra
);

input clock, reset, fim_contador;

output reg conta, registra, zera;
    
localparam [1:0] // Estados
    inicial = 2'b00,
    contador = 2'b01, 
    registrador = 2'b10,
	 final = 2'b11;

reg[1:0] state_reg, state_next;

always @(posedge clock, posedge reset)
begin
    if(reset) // reset assincrono
        begin
        state_reg <= inicial;
        end
    else 
        begin
        state_reg <= state_next;
        end
end

always @(state_reg, fim_contador)
begin
    state_next = state_reg;
    
    registra = 1'b0; //retornar registra pra 0
    case(state_reg)
        inicial: begin
					 zera = 1'b1;
                state_next = contador; // inicial vai pro estado contador
					 end
        contador:
            begin
               conta = 1'b1; // ativa o contador
                if(fim_contador) // muda de estado quando contagem acaba
                    state_next = registrador;
                else    
                    state_next = contador; // else go to state zero.
            end
			registrador:
				begin
					registra = 1'b1;
					state_next = final;
				end
			final: 
            state_next = inicial;   
    endcase
end
endmodule