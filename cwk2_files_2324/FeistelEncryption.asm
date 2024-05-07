//------- setup --------
@R5
M=1
M=M+1
M=M+1
M=M+1 // do the rotation and xor 4 times
//------- end setup ------

@skip_functions
0;JMP


(skip_functions)
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
M=M+M
M=M+M
M=M+M
M=M+M
M=M+M
M=M+M
M=M+M
M=M+M
//--------------------- end L0 in R6  -------------------------------

//--------------------- r0 in R7 -----------------------------
@R2
D=M
@R7  // trim r0 on the left side
M=D
M=M+M
M=M+M
M=M+M
M=M+M
M=M+M
M=M+M
M=M+M
M=M+M

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
(div_r0)
@R4
M=0
(div_loop_r0)
@R4
M=M+1
@R7
M=M-1
M=M-1
D=M
D=D-1
@div_loop_r0
D-1;JGE // div again if >=0
@R4
D=M
@R7
M=D
//---- end div by 2 ----

@R3
M=M-1
D=M
@div_r0
D;JLE // div by 2 until done 8 times
//-------------------- end r0 in R7 --------------------------

//-------------------- Li+1 in R6 and Li in R8 ---------------------------
@R6
D=M
@R8
M=D
@R7
D=M
@R6
M=D
//-------------------- end Li+1 in R6 and Li in R8 -----------------------

//-------------------- Ri+1 in R7 ---------------------------
@R1
D=M
 




//--------------------- ROTATE --------------------------------

@loop
0;JMP

(check_if_neg)
    @R1
    M=M+1 //if old num is neg then the 1 on the left was a 1
@continue
0;JMP


(loop)

//-----------------------------  XOR  -------------------------

    @R1
    D=M
    @R3
    M=!D
    @R4
    M=D

    @R2
    D=!M

    @R4
    M=D&M//R4 IS NOT R2 AND R1

    @R2
    D=M
    @R3
    M=M&D// R3 IS NOT R1 AND R2
    D=M

    @R4
    M=D|M
    D=M
    @R2
    M=D

//--------------------- EOF XOR  ------------------------------


    @R1
    D=M
    M=M+D       //R1 is sum

    @R5
    M=M-1       //count that we summed

    @check_if_neg
    D;JLT       // if old num is neg then on the left was 1 so we carry it
    (continue)

@R5
D=M
@loop
D;JGT


//------------------------------ EOF ROTATE  ------------------
@R2
D=M
@R0
M=D