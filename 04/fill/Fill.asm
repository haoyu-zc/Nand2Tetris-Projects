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
(LOOP_WHITE)
@i
D=M
@pixels
D=D-M
@LISTEN
D;JEQ

@SCREEN
D=M
@i
A=D+M
M=0

// i++
@i
M=M+1

@LOOP_WHITE
0;JMP

@KBD
D=M
@BLACK
D;JGT

(LOOP_BLACK)
@i
D=M
@pixels
D=D-M
@LISTEN
D;JEQ

@SCREEN
D=M
@i
A=D+M
M=1

// i++
@i
M=M+1

@LOOP_BLACK
0;JMP

@LISTEN
0;JEQ