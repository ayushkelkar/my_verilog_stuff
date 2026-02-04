module norusingnand
(
    input a,
    input b,
    inout w,
    inout y,
    inout z,
    output x
);

assign w = ~(a & a);
assign y = ~(b & b);
assign z = ~(w & y);
assign x = ~(z & z);

endmodule