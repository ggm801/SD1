 module registrador(D,clock,reset,enable, Q);
    input[3:0] D; // Data input
    input clock,reset,enable;
    output[3:0] Q; // output Q
    reg[3:0] Q;
    always @(posedge clock or posedge reset)
    begin
            if(reset)
                    Q <= 4'b0000;
            else if (enable)
                    Q <= D;
    end
    endmodule