module orusingnor
(
    input a,
    input b,
    inout y,
    output x
);

assign y = ~(a | b);
assign x = ~(y | y);

endmodule