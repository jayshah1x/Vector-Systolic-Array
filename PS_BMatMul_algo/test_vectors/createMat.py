import numpy as np

# Generate random 8x8 matrix A between -1 and 1
matrix_A = np.random.uniform(-1, 1, size=(8,8)).astype(np.float32) 

# Generate random 8x8 matrix B between -1 and 1  
matrix_B = np.random.uniform(-1, 1, size=(8,8)).astype(np.float32)

# Save matrices to text files
np.savetxt('matA.txt', matrix_A)
np.savetxt('matB.txt', matrix_B)
