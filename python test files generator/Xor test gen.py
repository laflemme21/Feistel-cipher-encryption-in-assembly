import random

# Function to generate a random 16-bit number


def generate_16bit_number():
    return random.randint(-2**15 + 1, 2**15 - 1)


def gen_num_1to16():
    return random.randint(1, 15)


def operation_to_test(a, b):

    return ((a << b) | (a >> (16 - b))) & (2**16 - 1)


def write_to_file(filename, text):
    with open(filename, 'a') as f:
        f.write(text)


def main(cmp, tst):
    for i in range(10):
        a = generate_16bit_number()
        b = gen_num_1to16()
        result = operation_to_test(a, b)
        print(a, b, result, '\n', bin(a), len(
            bin(a)), '\n', bin(result), '\n\n')
        """write_to_file(cmp,
                      "|  ")
        for i in range(6-len(str(result))):
            write_to_file(cmp,
                          " ")
        write_to_file(cmp,
                      str(result)+"  |\n")
        write_to_file(tst,
                      "load XOR.asm,\nset RAM[3] "+str(a)+", set RAM[4] "+str(b)+", set RAM[5] 0, repeat 60 {ticktock;} output;\n")"""


main('C:\\Users\\carlk\\Documents\\GitHub\\Feistel-cipher-encryption-in-assembly\\cwk2_files_2324\\Rotate1.cmp',
     'C:\\Users\\carlk\\Documents\\GitHub\\Feistel-cipher-encryption-in-assembly\\cwk2_files_2324\\Rotate1.tst')
