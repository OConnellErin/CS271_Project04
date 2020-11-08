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

    @white
    M=0
    D=-1
    @black
    M=D
    @RESET
    0;JMP

(LOOP)
    @KBD
    D=M
    @SETB
    D;JNE
    @SETW
    0;JMP

(DRAW)
    @color
    D=M
    @cursor
    A=M
    M=D
    @cursor
    M=M+1
    @24576
    D=A
    @cursor
    D=D-M
    @RESET
    D;JLE
    @LOOP
    0;JMP

(SETW)
    @white
    D=M
    @color
    M=D
    @DRAW
    0;JMP

(SETB)
    @black
    D=M
    @color
    M=D
    @DRAW
    0;JMP

(RESET)
    @SCREEN
    D=A
    @cursor
    M=D
    @LOOP
    0;JMP