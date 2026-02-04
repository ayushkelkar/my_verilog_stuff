module xorusingnor
(
    input a,b,
    inout c,d,e,f,g,
    output x
);
// XOR = A'B + AB'
assign c = ~(a | a); // A'
assign d = ~(b | b); // B'
assign e = ~(b | c); // A'B
assign f = ~(a | d); // AB'
assign g = ~(e | f); // (A'B + AB')'
assign x = ~(g | g); // NOT g

endmodule