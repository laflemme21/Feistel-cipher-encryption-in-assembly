// This file is adapted from www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/mult/Mult.tst

load XOR.asm,
output-file XOR1.out,
compare-to XOR1.cmp,
output-list RAM[7]%D2.6.2;

set RAM[1] 0, set RAM[7] 1, repeat 22 {ticktock;} output;
load XOR.asm,
load XOR.asm,
set RAM[1] 22282, set RAM[7] -11854,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[1] -24214, set RAM[7] 28506,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[1] 25904, set RAM[7] -14876,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[1] 11481, set RAM[7] -16571,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[1] 31964, set RAM[7] -11840,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[1] -2878, set RAM[7] -32344,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[1] 70, set RAM[7] 18276,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[1] 2375, set RAM[7] -28278,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[1] -14271, set RAM[7] 24743,  repeat 22 {ticktock;} output;
load XOR.asm,
set RAM[1] -31286, set RAM[7] -28523,  repeat 22 {ticktock;} output;
