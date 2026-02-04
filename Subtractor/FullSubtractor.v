// Diff = A XOR B XOR Borrowin
// Borrowout = A'(B XOR Borrowin) + B.Borrowin
// There's some problem with the outputs. Borrowout isn't showing correct values once there are more than 1 true inputs. Fix later.
// It might be due to operator precedence order(s) but I split it into c-f but its still misbehaving.
module fs
(
    input a,b,borrowin,
    output diff,borrowout
);
wire c,d,e,f;
assign diff = a ^ b ^ borrowin;
assign c = ~a;
assign d = b ^ borrowin;
assign e = b & borrowin;
assign f = c & d;
assign borrowout = (e | f);

endmodule