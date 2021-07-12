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

Y0 = (w & ~y0) + (y1 & ~y0);
Y1 = y1 xor y0; // alterar


endmodule