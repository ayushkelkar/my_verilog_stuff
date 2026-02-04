module notusingnand_tb;
reg A;
wire X;

notusingnand bring
(
    .a(A),
    .x(X)
);

initial begin
    $dumpfile("notusingnand.vcd");
    $dumpvars(0,notusingnand_tb);

    A=0;
    #10;
    A=1;
    #10;

    $finish;
end
endmodule