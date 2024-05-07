load test.asm,
output-file test.out,
compare-to test.cmp,
output-list RAM[6]%D2.6.2;

set RAM[0] 0,   // Set test arguments
set RAM[1] 0,
set RAM[2] 18960;
repeat 10000 {
  ticktock;
}
output;
load test.asm,
set RAM[0] 0,   // Set test arguments
set RAM[1] 0,
set RAM[2] 10150;
repeat 6000 {
  ticktock;
}
output;