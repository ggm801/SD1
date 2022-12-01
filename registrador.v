 module registrador(D,clk,reset,enable, Q);
    input[3:0] D; // Data input
    input clk,reset,enable;
    output[3:0] Q; // output Q
    reg[3:0] Q;
    always @(posedge clk or posedge reset)
    begin
            if(reset)
                    Q <= 4'b0;
            else if (enable)
                    Q <= D;
    end
    endmodule