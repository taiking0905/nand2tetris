// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.

@KBD
D = M
@BLACK
D;JGT   // キーが押されていたら黒へ

// --- 白く塗る場合 ---
@0
D = A
@WRITE
0;JMP

(BLACK)
// --- 黒く塗る場合 ---
@-1
D = A

(WRITE)
// --- 書き込み処理 ---
@R0
A = M
M = D

@R0
M = M + 1

@R1
M = M + 1
@R1
D = M
@8192
D = D - A
@LOOP
D;JLT   // 8192未満ならループ

@R1
M = 0   // カウンタをリセット
@LOOP
0;JMP
