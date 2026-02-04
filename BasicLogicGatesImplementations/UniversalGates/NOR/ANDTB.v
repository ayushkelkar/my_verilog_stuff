module andusingnor_tb;
reg A,B;
wire X;

andusingnor bring
(
    .a(A),
    .b(B),
    .x(X)
);

initial begin
    $dumpfile("and.vcd");
    $dumpvars(0,andusingnor_tb);

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