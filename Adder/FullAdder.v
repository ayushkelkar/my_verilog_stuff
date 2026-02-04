// Sum = A'B'C + A'BC' + AB'C' + ABC
// Sum = A'B'C + ABC + A'BC' + AB'C'
// Sum = (A'B'+ AB)C + (A'B + AB')C'
// Sum = (A XOR B)'C + (A XOR B)C
// Sum = (A XOR B) XOR C ==> Sum = A XOR B XOR C
// Carry = A'BC + AB'C + ABC' + ABC
// Carry = (A XOR B)C + AB
// Carry = AB + BC + CA
module fulladder
(
    input a,b,c,
    output sum,carryout
);

assign sum = a ^ b ^ c;
assign carryout = (a & b) | (b & c) | (c & a);

endmodule