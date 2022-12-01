module display7seg(nota, s_nota);
     
     input [3:0] nota;
     output [6:0] s_nota;
     reg [6:0] s_nota;

// sempre bloqueia se o valor de nota for alterado
    always @(nota)
    begin
        case (nota) 
            4'b0000 : s_nota = 7'b0000001;
            4'b0001 : s_nota = 7'b1001111;
            4'b0010 : s_nota = 7'b0010010;
            4'b0011 : s_nota = 7'b0000110;
            4'b0100 : s_nota = 7'b1001100;
            4'b0101 : s_nota = 7'b0100100;
            4'b0110 : s_nota = 7'b0100000;
            4'b0111 : s_nota = 7'b0001111;
            4'b1000 : s_nota = 7'b0000000;
            4'b1001 : s_nota = 7'b0000100;
            //caso não seja nenhum desses, apaga o display
            default : s_nota = 7'b1111111; 
        endcase
    end
    
endmodule