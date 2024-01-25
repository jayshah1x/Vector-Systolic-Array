import sys
import threading
import numpy as np

# Block size for matrix multiplication
block_size = 4

# Dictionary to store the final result
finalresult = {}

# Read matrix A from file specified in command-line argument
matA = open(sys.argv[1], "r")
lines = matA.readlines()
A = []
for line in lines:
    A.append(line.split())
matA.close()

# Read matrix B from file specified in command-line argument
matB = open(sys.argv[2], "r")
newlines = matB.readlines()
B = []
for line in newlines:
    B.append(line.split())
matB.close()

# Check if matrices are compatible for multiplication
if len(A[0]) != len(B):
    print("Incompatible matrices.")
    sys.exit()

# Calculate dimensions and block counts
p = len(A) // block_size
q = len(A[0]) // block_size
r = len(B[0]) // block_size

# Function to perform matrix multiplication
def matrix_multiply(X, Y):
    result = []
    for row_X in X:
        new_row = []
        for col_Y in zip(*Y):
            element = sum(int(a) * int(b) for a, b in zip(row_X, col_Y))
            new_row.append(element)
        result.append(new_row)
    return result

# Function to add two matrices element-wise
def add_matrices(a, b):
    res = []
    for i in range(len(a)):
        row = []
        for j in range(len(a[0])):
            row.append(a[i][j] + b[i][j])
        res.append(row)
    return res

# Save block function   
def save_block(block, filename):
  np.savetxt(filename, block)

# Thread function to perform matrix multiplication for a block
def thread_function(i, k, x):
    global A
    global B
    global finalresult
    global p
    global r
    # Initialize the result matrix for the block
    mat = [[0 for _ in range(block_size)] for _ in range(block_size)]
    for j in range(q):
        # Multiply and add matrices for the block
        mat = add_matrices(mat, matrix_multiply(
            [row[i * block_size:(i + 1) * block_size] for row in A[j * block_size:(j + 1) * block_size]],
            [row[j * block_size:(j + 1) * block_size] for row in B[k * block_size:(k + 1) * block_size]]
        ))

        block_nameA = f"A{i+1}{j+1}"
        block_nameB = f"B{i+1}{k+1}"

        print('``````````````````````````````````````````')

        print(block_nameA)
        print(block_nameB)

        # print('``````````````````````````````````````````')

        # print(A)

        # print('``````````````````````````````````````````')

        # print(B)
        temp_arr_A = A[j*block_size:(j+1)*block_size]
        temp_arr_B = B[k*block_size:(k+1)*block_size]

        print(temp_arr_B)
        print(type(temp_arr_B))

        # num_list_A = [float(x) for x in temp_arr_A]
        # num_list_B = [float(x) for x in temp_arr_B]
        # save_block(num_list_A, block_nameA)
        # save_block(num_list_B, block_nameB)
    # Store the result in the dictionary
    finalresult[x] = mat

# Initialize variables for thread indices
x = 0

# Create a list to store threads
threads = []

# Create threads for matrix multiplication
for i in range(p):
    for k in range(r):
        threads.append(threading.Thread(target=thread_function, args=(i, k, x)))
        x += 1

# Start all threads
for thread in threads:
    thread.start()

# Wait for all threads to finish
for thread in threads:
    thread.join()

# Write the result to an output file
output_file = open("output.txt", "w")
for k in range(r):
    for i in range(block_size):
        for j in range(p):
            output_file.write(str(finalresult[(j * r) + k][i])[1:-1] + " ")
        output_file.write("\n")
output_file.close()