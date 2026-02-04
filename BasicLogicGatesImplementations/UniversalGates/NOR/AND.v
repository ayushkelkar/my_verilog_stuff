module andusingnor
(
    input a,b,
    inout y,z,
    output x
);

assign y = ~(a | a);
assign z = ~(b | b);
assign x = ~(y | z);

endmodule