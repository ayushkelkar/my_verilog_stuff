module nandgate
(
    input a,
    input b,
    output x
);

assign x = ~(a & b);

endmodule