import sys
import threading

block_size = 4

finalresult = {}

matA = open(sys.argv[1], "r")
lines = matA.readlines()
A = []
for line in lines:
    A.append(line.split())
matA.close()

matB = open(sys.argv[2], "r")
newlines = matB.readlines()
B = []
for line in newlines:
    B.append(line.split())
matB.close()

if len(A[0]) != len(B):
    print("Incompatible matrices.")
    sys.exit()

p = len(A) // block_size
q = len(A[0]) // block_size
r = len(B[0]) // block_size

def matrix_multiply(X, Y):
    result = []
    for row_X in X:
        new_row = []
        for col_Y in zip(*Y):
            element = sum(int(a) * int(b) for a, b in zip(row_X, col_Y))
            new_row.append(element)
        result.append(new_row)
    return result

def add_matrices(a, b):
    res = []
    for i in range(len(a)):
        row = []
        for j in range(len(a[0])):
            row.append(a[i][j] + b[i][j])
        res.append(row)
    return res

def thread_function(i, k, x):
    global A
    global B
    global finalresult
    global p
    global r
    mat = [[0 for _ in range(block_size)] for _ in range(block_size)]
    for j in range(q):
        mat = add_matrices(mat, matrix_multiply(
            [row[i * block_size:(i + 1) * block_size] for row in A[j * block_size:(j + 1) * block_size]],
            [row[j * block_size:(j + 1) * block_size] for row in B[k * block_size:(k + 1) * block_size]]
        ))
    finalresult[x] = mat

x = 0
threads = []
for i in range(p):
    for k in range(r):
        threads.append(threading.Thread(target=thread_function, args=(i, k, x)))
        x += 1

for thread in threads:
    thread.start()

for thread in threads:
    thread.join()

output_file = open("output.txt", "w")
for k in range(r):
    for i in range(block_size):
        for j in range(p):
            output_file.write(str(finalresult[(j * r) + k][i])[1:-1] + " ")
        output_file.write("\n")

output_file.close()
