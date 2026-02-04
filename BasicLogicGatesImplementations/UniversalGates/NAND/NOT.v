module notusingnand
(
    input a,
    output x
);

assign x = ~(a & a);

endmodule