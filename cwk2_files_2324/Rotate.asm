@loop
0;JMP

(check_if_neg)
    @R3
    M=M+1 //if old num is neg then the 1 on the left was a 1
@continue
0;JMP


(loop)
    @R3
    D=M
    M=M+D       //R3 is sum

    @R4
    M=M-1       //count that we summed

    @check_if_neg
    D;JLT       // if old num is neg then on the left was 1 so we carry it
    (continue)

@R4
D=M
@loop
D;JGT

@R3
D=M
@R5
M=D