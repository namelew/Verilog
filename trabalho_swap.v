module Swap (
    input rst,
    input clk,
    input w,
    output h1,
    output c1,
    output h2,
    output c2,
    output h3,
    output c3,
    output done
);

reg y0, y1; // saidas flip-flop
wire Y0, Y1; // circuitos de excitacao

assign Y0 = (w & ~y0) + (y1 & ~y0);
assign Y1 = y1 ^ y0;

assign h1 = y1 & ~y0;
assign h2 = y1 & ~y0;
assign h3 = y1 & y0;

assign c1 = y1 & y0;
assign c2 = y1 & ~y0;
assign c3 = y1 & ~y0;

assign done = y1 & y0;

always @(posedge clk or rst) begin
    if(rst == 1) begin
        y0 <= 0;
        y1 <= 0;
    end
    else begin
        y0 <= Y0;
        y1 <= Y1;
    end
end

endmodule

module testebench;
reg rst0 = 0;
reg clk0 = 0;
reg w0 = 0;

wire h10, h20, h30, c10, c20, c30, done0;

Swap FMS(rst0, clk0, w0, h10, h20, h30, c10, c20, c30, done0);

always #1 begin
    clk0 <= ~clk0;
end

initial begin
    $dumpvars;
    #1
    rst0 <= 1;
    #1
    rst0 <= 0;
    w0 <= 1;
    #4
    w0 <= 0;
    $finish;
end
endmodule
