module notusingnor
(
    input a,
    output x
);

assign x = ~(a | a);

endmodule