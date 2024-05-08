load test.asm,
output-file test.out,
compare-to test.cmp,
output-list RAM[1]%D2.6.2;

set RAM[0] 0,   // Set test arguments
set RAM[1] 155,
set RAM[2] 0;
repeat 20 {
  ticktock;
}
output;
load test.asm,
set RAM[0] 0,   // Set test arguments
set RAM[1] 236,
set RAM[2] 0;
repeat 20 {
  ticktock;
}
output;