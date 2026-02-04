module notgate_tb;
reg A;
wire X;

notgate bringvalues
(
    .a(A),
    .x(X)
);

initial begin
    $dumpfile("not.vcd");
    $dumpvars(0,notgate_tb);

    A=0;
    #10;
    A=1;
    #10;

    $finish;
end
endmodule