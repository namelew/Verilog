module sintese (
    input rst,
    input clk,
    input w,
    output z
);

    reg Y;
    parameter A = 1'b0, B = 1'b1;

    assign z = w & Y;

    always @(posedge clk or rst) begin
        if(rst == 1) Y <= A;
        else begin
            case(Y)
                A: if(w == 1) Y<=B;
                B: if(w == 0) Y<= A;
            endcase
        end
    end
    
endmodule

module testebench;
    reg rst0 = 0;
    reg clk0 = 0;
    reg w0 = 0;
    wire z0;

    sintese FSM(rst0, clk0, w0, z0);

    always #1 begin
        clk0 <= ~clk0;
    end

    initial begin
        $dumpvars;
        rst0 <= 1;
        w0 <= 0;
        #1
        rst0 <= 0;
        #2
        w0 <= 1;
        #2
        w0 <= 0;
        #2
        w0 <= 1;
        #4
        w0 <= 0;
        #2
        w0 <= 1;
        #7
        w0 <= 0;
        $finish;
    end
    
endmodule