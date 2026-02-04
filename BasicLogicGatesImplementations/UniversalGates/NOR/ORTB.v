module orusingnor_tb;
reg A,B;
wire X;

orusingnor bring
(
    .a(A),
    .b(B),
    .x(X)
);

initial begin
    $dumpfile("or.vcd");
    $dumpvars(0,orusingnor_tb);

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