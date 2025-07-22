// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
(LOOP)
@SCREEN
    D = A
    @R0
    M = D       // R0 = SCREEN 開始アドレス

    @R1
    M = 0       // R1 = カウンタ（0〜8191）

    @KBD
    D = M
    @WHITE
    D;JEQ    // キーが押されていなければ白へ

    @BLACK
    0;JMP    // キーが押されていれば黒へ

    (WHITE)
        @R0
        A = M
        M = 0  
        @WRITE
        0;JMP

    (BLACK)
        @R0
        A = M
        M = -1  
        @WRITE
        0;JMP

    (WRITE)

        @R0
        M = M + 1
        @R1
        M = M + 1

@LOOP
0;JMP

(END)
@END
0;JMP
