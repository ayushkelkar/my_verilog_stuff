module halfaddertb;
reg A,B;
wire Sum,Carry;

halfadder bring
(
    .a(A),
    .b(B),
    .sum(Sum),
    .carry(Carry)
);

initial begin
    $dumpfile("HalfAdder.vcd");
    $dumpvars(0,halfaddertb);

    A=0;B=0;
    #10;
    A=0;B=1;
    #10;
    A=1;B=0;
    #10;
    A=1;B=1;
    #10;

    $finish;
end
endmodule