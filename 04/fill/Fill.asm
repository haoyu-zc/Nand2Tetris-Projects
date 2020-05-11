// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
@0
D=A
@i
M=D

@8192
D=A
@pixels
M=D

(LISTEN)
@KBD
D=M
@LOOP_BLACK
D;JGT

@LOOP_WHITE
0;JMP

(LOOP_BLACK)
@i
D=M
@pixels
D=D-M
@LISTEN
D;JEQ

@SCREEN
// !important: bug will occur if written "D=M"
D=A
@i
A=D+M
// let word M to be -1 to get 16 bits of "1", which is 16 black pixels
M=-1

// i++
@i
M=M+1

@LISTEN
0;JMP

(LOOP_WHITE)
@i
D=M
@LISTEN
D;JLT

@SCREEN
// !important: bug will occur if written "D=M"
D=A
@i
A=D+M
// let word M to be -1 to get 16 bits of "1", which is 16 black pixels
M=0

// i++
@i
M=M-1

@LISTEN
0;JMP