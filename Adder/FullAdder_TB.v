module fulladdertb;
reg A,B,C;
wire Sum,Carryout;

fulladder bring
(
    .a(A),
    .b(B),
    .c(C),
    .sum(Sum),
    .carryout(Carryout)
);

initial begin
    $dumpfile("fulladder.vcd");
    $dumpvars(0,fulladdertb);

    A=0;B=0;C=0;
    #10;
    A=0;B=0;C=1;
    #10;
    A=0;B=1;C=0;
    #10;
    A=0;B=1;C=1;
    #10;
    A=1;B=0;C=0;
    #10;
    A=1;B=0;C=1;
    #10;
    A=1;B=1;C=0;
    #10;
    A=1;B=1;C=1;
    #10;

    $finish;
end
endmodule