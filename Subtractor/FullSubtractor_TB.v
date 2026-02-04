module fs_tb;
reg A,B,Borrowin;
wire Diff,Borrowout;

fs bring
(
    .a(A),
    .b(B),
    .borrowin(Borrowin),
    .diff(Diff),
    .borrowout(Borrowout)
);

initial begin
    $dumpfile("fs.vcd");
    $dumpvars(0,fs_tb);

    A=0;B=0;Borrowin=0;
    #10;
    A=0;B=0;Borrowin=1;
    #10;
    A=0;B=1;Borrowin=0;
    #10;
    A=0;B=1;Borrowin=1;
    #10;
    A=1;B=0;Borrowin=0;
    #10;
    A=1;B=0;Borrowin=1;
    #10;
    A=1;B=1;Borrowin=0;
    #10;
    A=1;B=1;Borrowin=1;
    #10;

    $finish;
end
endmodule