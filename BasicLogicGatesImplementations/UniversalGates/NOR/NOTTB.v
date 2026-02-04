module notusingnor_tb;
reg A;
wire X;

notusingnor bring
(
    .a(A),
    .x(X)
);

initial begin
    $dumpfile("not.vcd");
    $dumpvars(0,notusingnor_tb);

    A=0;
    #10;
    A=1;
    #10;

    $finish;
end
endmodule