// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

@SCREEN
D = A
@R0
M = D

@R1 
M = 0

(LOOP)
    @R1
    D = M
    //@8192
    @2
    D = D -A
    @END
    D;JGE

    @KBD
    D = M
    @-1
    D;JGT
    @0

    @R0
    A = M
    M = D

    @R0 
    M = M + 1

    @R1
    M = M + 1
    @LOOP
    0;JMP

(END)
@END
0;JMP