# Verilog Expressions for Gates
## Basic Gates
### AND
` x = a & b; `
### NAND
` x = ~(a & b); `
### OR
` x = a | b; `
### NOR
` x = ~(a | b) `
### NOT
` x = ~a `

## Universal Gates
### NAND
#### NOT
` x = ~(a & a); `
#### AND
```verilog
 y = ~(a & b);
 x = ~(y & y);
```
#### OR
```verilog
y = ~(a & a);
z = ~(b & b);
x = ~(y & z);
```
#### NOR
```verilog
y = ~(a & a);
z = ~(b & b);
w = ~(y & z);
x = ~(w & w);
```

### NOR
#### NOT
` x = ~(a | a); `
#### OR
```verilog
 y = ~(a | b);
 x = ~(y | y);
```
#### AND
```verilog
 y = ~(a | a);
 z = ~(b | b);
 x = ~(y | z);
```
#### XOR
```verilog
// XOR is A'B + AB'
assign c = ~(a | a); // A'
assign d = ~(b | b); // B'
assign e = ~(b | c); // A'B
assign f = ~(a | d); // AB'
assign g = ~(e | f); // (A'B + AB')'
assign x = ~(g | g); // NOT g
```