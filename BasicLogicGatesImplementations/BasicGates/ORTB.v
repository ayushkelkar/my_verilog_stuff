module orgate_tb;
reg A,B;
wire X;

orgate bringvalue
(
    .a(A),
    .b(B),
    .x(X)
);

initial 
begin
    $dumpfile("or.vcd");
    $dumpvars(0,orgate_tb);

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
