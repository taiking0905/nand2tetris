// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

(LOOP)
    @SCREEN
    D = A
    @R0
    M = D       // R0 = SCREEN 開始アドレス

    @R1
    M = 0       // R1 = カウンタ（0〜8191）

    @KBD
    D = M
    @BLACK
    D;JGT

(WHITE)
    @0
    D = A
    @R2
    M = D       // R2 = 0（白）

    @R2
    D = M

    @R0
    A = M
    M = D

    @R0
    M = M + 1

    @R1
    M = M + 1

    @8192
    D = A
    @R1
    D = M - D   // D = R1 - 8192

    @LOOP
    D;JGE

    @WHITE
    0;JMP


(BLACK)
    @-1
    D = A
    @R2
    M = D       // R2 = 0（白）

    @R2
    D = M

    @R0
    A = M
    M = D

    @R0
    M = M + 1

    @R1
    M = M + 1

    @8192
    D = A
    @R1
    D = M - D   // D = R1 - 8192

    @LOOP
    D;JGE

    @BLACK
    0;JMP


(END)
@END
0;JMP
