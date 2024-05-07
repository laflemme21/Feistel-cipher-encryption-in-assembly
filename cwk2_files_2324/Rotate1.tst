// This file is adapted from www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/mult/Mult.tst

load Rotate.asm,
output-file Rotate1.out,
compare-to Rotate1.cmp,
output-list RAM[5]%D2.6.2;

set RAM[3] 1, set RAM[4] 1, set RAM[5] 0, repeat 40 {ticktock;} output;
load Rotate.asm,
set RAM[3] 5, set RAM[4] 2, set RAM[5] 0, repeat 40 {ticktock;} output;
load Rotate.asm,
set RAM[3] -782, set RAM[4] 3, set RAM[5] 0, repeat 60 {ticktock;} output;
load Rotate.asm,
set RAM[3] 28911, set RAM[4] 9, set RAM[5] 0, repeat 150 {ticktock;} output;
load Rotate.asm,
set RAM[3] -15811, set RAM[4] 11, set RAM[5] 0, repeat 160 {ticktock;} output;
load Rotate.asm,
set RAM[3] -8350, set RAM[4] 47, set RAM[5] 0, repeat 700 {ticktock;} output;