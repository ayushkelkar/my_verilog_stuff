module andgate_tb;

reg A,B;
wire X;

andgate bringvalues1
(
    .a(A),
    .b(B),
    .x(X)
);

initial
begin
    $dumpfile("and.vcd");
    $dumpvars(0,andgate_tb);

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
