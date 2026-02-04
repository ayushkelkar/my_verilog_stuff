module hs_tb;
reg A,B;
wire Diff,Borrow;

hs bring
(
    .a(A),
    .b(B),
    .diff(Diff),
    .borrow(Borrow)
);

initial begin
    $dumpfile("hs.vcd");
    $dumpvars(0,hs_tb);

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