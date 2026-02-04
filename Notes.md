# Verilog
---
## Modules
A module can usually be divided into 3 main categories:
### I/O Ports
- These are like the inputs and outputs to the hardware
### Signal Declaration
- This portion is used to specify the internal connections between the signals/hardware
- For example, your hardware internally has 2 "wires" aka. connections, so you'd describe them within a module as:
```verilog
wire a,b;
```
### Body
- This is used to describe said internal signals within the module. For example, in the previous snippet, 2 wires are defined within the module, so the body, assigns them or describes something to those wires. Like:
```verilog
assign a = A & B; // This assigns the wire a to the operation A AND B
assign b = A ^ B; // This assigns the wire b to the operation A OR B
```

## Lexical Elements
There are several lexical elements to Verilog, shown below:
### Identifier
- The identifier gives a uniqye name to an object, like for example `a` or `b`. 
- It is composed of letters (A-Z,a-z), digits (0-9), underscore (_), dollar (It is mostly used with system tasks/functions).
- The first character of an identifier must be a letter or underscore, else it will be an illegal identifier.
- Verilog is also case-sensitive. This means an identifier `a` will not be the same as identifier `A`.
- By default, if the declaration of the data type is omitted before the identifier, it is assigned the type `wire`.

### Keywords
- These are protected identifiers which are used by verilog to describe the language constructs. For example: `module`, `wire` are keywords and cannot be used to name identifiers.

### Whitespace
- This includes the space, tab, and newline characters in general.
##### Space is just space
##### Tab is `\t`
##### New Line is `\n`

### Comments
- Comments are for documentation purposes, and will be ignored by the software.
- It can be single or multiline.
Example:
```verilog
// This is a single line comment
/* This is a 
multiline comment */
```

## Data Types
### Four Value System
Four basic values are used in most data types:
- `0`: for Logic "0", or False.
- `1`: for Logic "1", or True.
- `z`: For high-Z state
- `x`: for an unknown value.
Some info about `z`:-
#### High Impedance State (high-Z state):
- This is a condition where the output is neither `high` nor `low` and is effectively disconnected (therefore high impedance). Its used typically in 3-input logic systems.
- For example:
Take a 3-input buffer, with inputs `A`,`B` and `C` where `A` is input, `B` is the control, and `C` is the output. 
Depending on the logic, if `B=0`, the circuit will be in a high-Z state and effectively disconnected or "open".
But, when `B=1`, the "switch" is closed, so `C`'s output will correspond to `A` as it is a buffer.
The `z` corresponds to the output of a tri-state buffer.

### Net Group
- The data types in Net Group represent the physical connections between the hardware components.
- They are used as outputs of continuous assignments and also as connection signals between modules.
#### wire
- This represents a connecting wire. Example:
```verilog
wire a, b; // These are 2 1-bit signals
```
##### Bus
- A collection of wires is called a bus, and we can represent a bus using a 1-dimensional array (or a vector). Example:
```verilog
wire [3:0] a,b; // 2 4-bit signals
//The syntax is: wire [MSB:LSB] identifier(s);
wire [7:0] c,d; // 2 8-bit signals
```
##### Memory
- A 2-dimensional array of wires is called memory. Its syntax is: `wire [m:0] identifier [n:0];`, which creates a m-by-n memory. Which means: A memory has `m` wires which are `n`-bits wide.
Example:
```verilog
wire [3:0] a [31:0]; // This creates a 32-by-4 memory
```

### Variable Group (aka. Register Group)
- The data types in Variable Group represent abstract storage, and are used in outputs of procedural assignments.
- The different data types in this are: `reg`, `integer`,`real`,`time` and `realtime`.

### Number Representation
- The general form of a number in verilog is:
`[sign] [size]'[base] [value]`
- The `[base]` is the radix of the number, it is `b` for binary, `o` for octal, `h` for hexadecimal, `d` for decimal.
- The `[value]` is the corresponding value of the number in the base.
- The `[size]` specifies the number of bits in the number, its optional. Number is known as "sized" if the `[size]` exists, and "unsized" otherwise.
- Some Examples:
```verilog
assign a = 4'b1010 // This stores a 4-bit binary "1010" in the wire a.
assign b = 5'h1a // This is storing the hex "1a" in the wire b, it will be 11010.
assign c = 8'h1a // This is the same as b, however it will have 3 leading 0 MSBs: 00011010m unlike wire b.
assign d = -4'b0001 // This stores the binary "-0001" in 2's compliment form, so wire d will have the value of 1111.
```
- By default, the base is decimal.

## Operators
### For bitwise gate-level description:
`~` is the bitwise NOT Operator<br>
`&` is the bitwise AND Operator<br>
`|` is the bitwise OR Operator<br>
`^` is the bitwise XOR Operator<br>

## Program Skeleton
### Port and Module Declaration (I/O Declaration)
This is where the module and ports of the program are defined. <br>
Syntax:
```verilog
module [modulename]
(
[mode] [data_type] [identifier],
...
...
...
[mode] [data_type] [identifier]
);
```
The [mode] can be `input`, `output`, or `inout`. Also, the datatype can be omitted if it is a `wire`.

### Program Body
Unlike C, the program body of a verilog module can be thought of as a collection of circuit parts. They are, therefore, operated in parallel and executed concurrently.

#### Describing Parts
There are several ways to describe parts within a module.
###### Continuous Assignment (assign):
Its syntax is:
```verilog
assign [signal_name] = [expression];
```
Each continuous assignment can be thought of as a circuit part.

#### Signal Declaration
This specifies the internal signals and parameters used within the module. These are analogous to interconnecting parts between the different circuit parts.
Its syntax is:
```verilog
[data_type] [port_name];
// Example:
wire a,b;
```

#### Structural Description
- A digital system is composed of several smaller subsystems, and we can mix/combine them to form larger, more complex systems. <br>
- Think of it like this: If modules are user-defined functions, then using structural description techniques, we can call the different user-defined functions within other user-defined functions if we wish.<br>
- This is called module instantiation.<br>
##### Connection by Name:
Its syntax is:
```verilog
[module_name] [instance_name]
(
.[port_name]([signal_name]),
...
...
.[port_name]([signal_name])
);
```
Example: Assume module `m1` is defined with signals `i` and `j`:
```verilog
module m2
(
input wire [1:0] a,b,
output wire ab
);
m1 instance1
(
.i(a[0]),  // Basically, a[0] = i, but since i is not defined within m2, we have to use this, because again defining i within m2 will cause the value to be changed
.j(b[0])  // Similarly, b[0] = j
);
m1 instance2
(
.j(a[1]),
.i(b[1])
);
assign ab = a & b;
```
- This used signals `i` and `j` defined in module `m1` to operate on signals `a` and `b` defined in module `m2`. 
- This form of mapping of signals is called as connection by name.
- The lower-level module is the instantiated module (`m1`) whose signals are referenced or connected by the higher-level module or current module (`m2`).

##### Connection by Ordered List:
Its syntax is:
```verilog
[module_name] [instance_name]
(
[signal],
[signal],
...
...
[signal]
);
```
This is more error-prone than connection by name, especially with many I/O Ports. 

##### Verilog Primitive
- Verilig has a set of predifined primitives that can be instantiated as modules.
- They correspond to gate-level function blocks.
- Think of them as built-in functions.
Example:
```verilog
module m1
(
input wire a,b,
output wire c,d
);

// NOT Primitive:
not a_not_b (a,b); // assign a = ~b;

// AND Primitive:
and a_and_b (c,a,b); // assign c = a & b;

// OR Primitive:
or a_or_b (d,a,b); // assign d = a | b;
```

##### User-Defined Primitives
- We can define primitives and use them as though they were pre-defined.
Example:
```verilog
primitive udp_or (a,b,c);
input a,b;
output c;
table
// a b:c;
0 0:0;
0 1:1;
1 0:1;
1 1:1;
endtable
endprimitive
```

## Test Bench
- A test bench simulates a physical lab bench and allows us to simulate the developed code.
Its syntax is:
```verilog
'timescale [simulation time unit]/[simulation time step]

module [module_name];
// Signal Declaration for the Module
// Instantiation of the Circuit to be Tested
// Test Vector Generator:
initial
begin
// Tests
$stop;
end
endmodule
```
Example:
Half Adder Module:
```verilog
module half_adder
(
input a,b,
output c
);
assign c = a ^ b;
endmodule
```
Testbench for the Half Adder Module:
```verilog
'timescale 100s/10s  // You can only use valid arguments. Valid Arguments are : 1,10,100. Using 4,5,etc. will be illegal syntax and will not compile.

module half_adder_testbench;
reg A, B;
wire C;

half_adder bringvalues
(
.a(A),
.b(B),
.c(C)
);

initial
begin
// Test 1:
A=0;B=0;C=0;
#10; // These are called timegaps, and they signify how long the signal stays this way for. So this means Test 1 will run for 10s and then move on to Test 2.
// Test 2:
A=0;B=1;C=1;
#10;
// Test 3:
A=1;B=1;C=1;
#10;
// Test 4:
A=1;B=1;C=0;
#10;
$stop;
end
endmodule
```

### (Personal Use) How to simulate using GTKWave/Terminal
#### Using VCD:
- You need `$dumpfile` and `$dumpvars` within the test vector generator for generating a file (VCD - Value Change Dump) which verilog can dump the signals into.
Its syntax is:
```verilog
// Testbench before Test Vector Generator
initial
begin
$dumpfile("filename.vcd");
$dumpvars([depth],[testbench_module_name]);
// Rest of the Tests and Testbench
```
- `[depth]` is the simulation scope, which means, how many variables to be included in the variable dump. `0` means dump all variables within the current module (so, `[testbench_module_name]`), `1` means to only include variables within the module that is within the current module (`[testbench_module_name]`), `2` means to include variables within the module that is within the module that is within the current module, and so on.

#### Using $monitor:
- If you need not visualise signals using a VCD, you can monitor then (text-based) in the terminal using `$monitor`.
Its syntax is:
```verilog
initial
begin
$monitor
(
"[Format Specifiers]",
[Signals to be Monitored]
);
end
```
For example:
```verilog
// Rest of the testbench
initial
begin
$monitor
(
"Time = %d, //%d means decimal
A = %b, //%b means binary
B = %b,
C = %b",
$time, //$time gives the time output
A,
B,
C
);
end
```
This gives output like:
```bash
Time = 0, A = 0, B = 0, C = 0
```
