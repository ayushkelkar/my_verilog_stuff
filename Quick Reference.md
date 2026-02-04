# Verilog Expressions for Gates
## Basic Gates
### AND - 08
` x = a & b `
### NAND - 00
` x = ~(a & b) `
### OR - 32
` x = a | b `
### NOR - 02
` x = ~(a | b) `
### NOT - 04
` x = ~a `

## Universal Gates
### NAND - 00
#### NOT
` x = ~(a & a) `
#### AND
```verilog
 y = ~(a & b)
 x = ~(y & y)
```
#### OR
```verilog
y = ~(a & a)
z = ~(b & b)
x = ~(y & z)
```
#### NOR
```verilog
y = ~(a & a)
z = ~(b & b)
w = ~(y & z)
x = ~(w & w)
```

### NOR - 02
#### NOT
` x = ~(a | a) `
#### OR
```verilog
 y = ~(a | b)
 x = ~(y | y)
```
#### AND
```verilog
 y = ~(a | a)
 z = ~(b | b)
 x = ~(y | z)
```
#### XOR
```verilog
// XOR is A'B + AB'
 c = ~(a | a) // A'
 d = ~(b | b) // B'
 e = ~(b | c) // A'B
 f = ~(a | d) // AB'
 g = ~(e | f) // (A'B + AB')'
 x = ~(g | g) // NOT g
```