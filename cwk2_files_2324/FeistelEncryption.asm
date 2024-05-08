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
@255
A=!A
D=A&D
@R6 // R6 saves L0
M=D
@loop
0;JMP
@8
D=A
@R4
M=D
(check_if_neg_L0)
    @R3
    M=M+1 //if old num is neg then the 1 on the left was a 1
@continueL0
0;JMP


(loopL0)
    @R3
    D=M
    M=M+D       //R3 is sum

    @R4
    M=M-1       //count that we summed

    @check_if_neg_L0
    D;JLT       // if old num is neg then on the left was 1 so we carry it
    (continueL0)

@R4
D=M
@loopL0
D;JGT

@R3
D=M
@R5
M=D
//--------------------- end L0 in R6  -------------------------------

//--------------------- r0 in R7 -----------------------------
@R2
D=M
@255
D=A&D
@R7 // R7 saves r0
M=D
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
M=D&M //R4 IS NOT R7 AND R1

@R7
D=M
@R3
M=M&D // R3 IS NOT R1 AND R7
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
    @256
    D=A 
    @R1    
    M=M-D
    M=M+1 //if old num is neg then the 1 on the left was a 
@continue
0;JMP


(skip_if)

@R1
D=M
M=M+D       //R1 is sum
D=M

@256
D=D&A
@check_if_neg
D;JNE      // if old num is not 0 the left was 1 so we carry it
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
@8
D=A 
@R4
M=D
(sumloop)
@R6  
D=M
M=M+D 
@R4
M=M-1
D=M
@sumloop
D;JLE
//--------------------- end L4 in R6  -------------------------------

//--------------------- r5 in R7 -----------------------------
@R7
D=M
@255
D=A&D
@R7 // R7 saves r5
M=D
//-------------------- end r5 in R7 --------------------------
@R6
M=M|D
D=M
@R0
M=D