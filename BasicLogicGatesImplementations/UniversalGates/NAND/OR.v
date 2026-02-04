module orusingnand
(
    input a,
    input b,
    inout y,
    inout z,
    output x
);

assign y = ~(a & a);
assign z = ~(b & b);
assign x = ~(y & z);

endmodule