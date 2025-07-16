// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.

// R2 = R0 * R1 を計算する
// 結果は R2 に入る

@R2
M = 0       // R2 = 0
@R3
M = 0       // R3 = 0

(LOOP)
    @R3
    D = M
    @R1
    D = M - D     // D = R1 - R3
    @END
    D;JLE         // if R3 >= R1, jump to END

    @R0
    D = M         // D = R0

    @R2
    M = M + D     // R2 += R0

    @R3
    M = M + 1     // R3++

    @LOOP
    0;JMP

(END)
    @END
    0;JMP         // 無限ループで終了（停止の代用）


