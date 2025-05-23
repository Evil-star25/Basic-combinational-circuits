module mux2 (
    input a,
    input b,
    input sel,
    output y
);

assign y = sel? a:b;

endmodule