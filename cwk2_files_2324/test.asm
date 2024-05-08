
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