// This file is adapted from www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/mult/Mult.tst

load XOR.asm,
output-file XOR1.out,
compare-to XOR1.cmp,
output-list RAM[5]%D2.6.2;

set RAM[3] 0, set RAM[4] 1, repeat 22 {ticktock;} output;
load XOR.asm,
load XOR.asm,
set RAM[3] 22282, set RAM[4] -11854,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[3] -24214, set RAM[4] 28506,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[3] 25904, set RAM[4] -14876,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[3] 11481, set RAM[4] -16571,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[3] 31964, set RAM[4] -11840,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[3] -2878, set RAM[4] -32344,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[3] 70, set RAM[4] 18276,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[3] 2375, set RAM[4] -28278,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[3] -14271, set RAM[4] 24743,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[3] -31286, set RAM[4] -28523,  repeat 22 {ticktock;} output;
