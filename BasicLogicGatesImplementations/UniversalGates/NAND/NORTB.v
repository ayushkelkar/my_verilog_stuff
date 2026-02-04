module norusingnand_tb;
reg A,B;
wire X;

norusingnand bring
(
    .a(A),
    .b(B),
    .x(X)
);

initial begin
    $dumpfile("nor.vcd");
    $dumpvars(0,norusingnand_tb);

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