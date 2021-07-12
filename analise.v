module analise (
    input rst,
    input clk,
    input ent,
    output y
);
reg Q0, Q1; // saidas do flip-flop
wire D0, D1;  // entradas do flip-flop

assign D0 = ent xor Q0; // associando a porta logica ao wire
assign D1 = ~ent & Q1+ent & Q0 & ~Q1+ent & ~Q0 & Q1;
assign y = QO & Q1;

//funcionamento do flip-flop
always @(posedge clk) begin
    Q0 = D0;
    Q1 = D1;
end
endmodule
//---------------------------------------------
module testebrench;
    reg ent0 = 0;
    reg rst0 = 0;
    reg clk0 = 0;
    wire y0;

    analise analise0(rst0, clk0, ent0, y0);

    initial begin
        $dumpvars;
        #1
        rst0 <= 1;
        #1
        rst0 <= 0;
        #1
        ent0 <= 1;
        clk0 <= 0;
        #1
        ent0 <= 1;
        clk0 <= 1;
        #1
        ent0 <= 1;
        clk0 <= 0;
        #2
        ent0 <= 1;
        clk0 <= 1;
        #1
        ent0 <= 1;
        clk0 <= 0;
        #2
        ent0 <= 1;
        clk0 <= 1;
        #1
        ent0 <= 0;
        clk0 <= 1;
        #2
        ent0 <= 1;
        clk0 <= 1;
        #1
        ent0 <= 1;
        clk0 <= 0;
        #2
        ent0 <= 1;
        clk0 <= 1;
        #1
        ent0 <= 1;
        clk0 <= 0;
        #1
        ent0 <= 0;
        clk0 <= 0;
        #1
        ent0 <= 0;
        clk0 <= 1;
        #1
        clk0 <= 0;
        #1
        $finish; 
    end
endmodule