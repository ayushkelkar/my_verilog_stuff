module orusingnand_tb;
reg A,B;
wire X;

orusingnand bring
(
    .a(A),
    .b(B),
    .x(X)
);

initial begin
    $dumpfile("or.vcd");
    $dumpvars(0,orusingnand_tb);

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