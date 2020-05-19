// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@R0
D=M
@ZERO
D;JEQ   // end program if icand=0
@icand
M=D

@R1
D=M
@ZERO
D;JEQ   // end program if factor=0
@factor
M=D
@result
M=0

(LOOP)  // add R0 to result in each loop
@factor
D=M
@STOP
D;JEQ

@result
D=M
@icand
D=D+M
@result
M=D
@factor // use factor as a mult counter
M=M-1
@LOOP
0;JMP

(ZERO)
@result
M=0

(STOP)
@result
D=M
@R2
M=D

(END)
@END
0;JMP