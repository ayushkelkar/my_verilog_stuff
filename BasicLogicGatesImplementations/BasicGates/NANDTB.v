module nandgate_tb;
reg A,B;
wire X;

nandgate bringvalues
(
    .a(A),
    .b(B),
    .x(X)
);

initial begin
    $dumpfile("nand.vcd");
    $dumpvars(0,nandgate_tb);
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