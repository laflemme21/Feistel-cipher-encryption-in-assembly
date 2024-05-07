//------- setup --------
@R5
M=1
M=M+1
M=M+1
M=M+1 // do the rotation and xor 4 times
//------- end setup ------

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
@JMP_divL0
D;JLE
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

@R3
M=M-1
D=M
@div_L0
D;JLE // div by 2 until done 8 times
//---- end div by 2 ----
(JMP_divL0)

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

//--------------------- r0 in R7 -----------------------------
@R2
D=M
@R7  // trim r0 on the left side
M=D
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

@JMP_divr0
D;JLE
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
(JMP_divr0)
@R3
M=M-1
D=M
@div_r0
D;JLE // div by 2 until done 8 times
//-------------------- end r0 in R7 --------------------------

//====================================== cipher loop ===============================
(loop)
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

//--- Ri Xor !Ki in R7  ---

@R1 // Ki
D=!M

@R3
M=!D
@R4
M=D

@R7
D=!M

@R4
M=D&M//R4 IS NOT R7 AND R1

@R7
D=M
@R3
M=M&D// R3 IS NOT R1 AND R7
D=M

@R4
M=D|M
D=M
@R7
M=D

//--- EOF Ri Xor !Ki in R7 ---

//--- Li Xor (Ri Xor !Ki) in R7  ---
@R8
D=M

@R3
M=!D
@R4
M=D

@R7
D=!M

@R4
M=D&M//R4 IS NOT R7 AND R1

@R7
D=M
@R3
M=M&D// R3 IS NOT R1 AND R7
D=M

@R4
M=D|M
D=M
@R7
M=D

//--- EOF Li Xor (Ri Xor !Ki) in R7 ---

//--------------------- ROTATE --------------------------------

@skip_if
0;JMP

(check_if_neg)
    @R1
    M=M+1 //if old num is neg then the 1 on the left was a 1
@continue
0;JMP


(skip_if)

@R1
D=M
M=M+D       //R1 is sum


@check_if_neg
D;JLT       // if old num is neg then on the left was 1 so we carry it
(continue)

//------------------------------ EOF ROTATE  ------------------

@R5
M=M-1       //count one loop i=i+1

@R5
D=M
@loop
D;JGT // if bigger than 0 redo
//============================ end cipher loop ================================

//--------------------- L4 in R6 -----------------------------
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
(div_L5)
@R4
M=0
(div_loop_L5)
@R4
M=M+1
@R6
M=M-1
M=M-1
D=M
D=D-1
@div_loop_L5
D-1;JGE // div again if >=0
@R4
D=M
@R6
M=D
//---- end div by 2 ----

@R3
M=M-1
D=M
@div_L5
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
//--------------------- end L4 in R6  -------------------------------

//--------------------- r5 in R7 -----------------------------
@R7
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
(div_r5)
@R4
M=0
(div_loop_r5)
@R4
M=M+1
@R7
M=M-1
M=M-1
D=M
D=D-1
@div_loop_r5
D-1;JGE // div again if >=0
@R4
D=M
@R7
M=D
//---- end div by 2 ----

@R3
M=M-1
D=M
@div_r5
D;JLE // div by 2 until done 8 times
//-------------------- end r5 in R7 --------------------------
@R6
D=M
@R0
M=D
@R7
D=M
@R0
M=M|D