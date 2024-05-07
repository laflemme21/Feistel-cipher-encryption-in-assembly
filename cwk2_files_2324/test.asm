
//--------------------- L0 in R6 -----------------------------
@R2
D=M
@R6 // R6 saves L0
M=D
@R3 // is equal to 8
M=0
M=M+1
M=M+1
M=M+1
M=M+1
M=M+1
M=M+1
M=M+1
M=M+1

//----- division by 2 --
(div_L0)
@R4
M=0
(div_loop_L0)
@R4
M=M+1
@R6
M=M-1
M=M-1
D=M
D=D-1
@div_loop_L0
D-1;JGE // div again if >=0
@R4
D=M
@R6
M=D
//---- end div by 2 ----

@R3
M=M-1
D=M
@div_L0
D;JLE // div by 2 until done 8 times

@R6  // get L0 on the left side
D=M
M=M+D
D=M
M=M+D
D=M
M=M+D
D=M
M=M+D

D=M
M=M+D
D=M
M=M+D
D=M
M=M+D
D=M
M=M+D
//--------------------- end L0 in R6  -------------------------------
