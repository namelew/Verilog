module moduleZZ (
    input w,
    input clk,
    input reset,
    output z
);

    reg y;

    assign z = y & w;

    always @(posedge clk) begin
        y <= w;
    end
    
endmodule

module testbrench;
    reg entrada = 0;
    reg clk = 0;
    reg reset = 0;

    wire saida;

    moduleZZ z(entrada, clk, reset, saida);

    initial begin
        $dumpvars;
        #2
        entrada <= 1;
        #2
        clk <= 1;
        #2
        clk <= 0;
        #2
        entrada <= 0;
        #2
        clk <= 1;
        $finish;
    end   
endmodule

