module norgate_tb;
reg A,B;
wire X;

norgate bringvals
(
    .a(A),
    .b(B),
    .x(X)
);

initial begin
    $dumpfile("nor.vcd");
    $dumpvars(0,norgate_tb);

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