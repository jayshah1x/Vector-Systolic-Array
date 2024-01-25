import numpy as np

# Read matrices from text files
matrix_a = np.loadtxt('matA.txt')  
matrix_b = np.loadtxt('matB.txt')

# Check if matrices can be multiplied  
if matrix_a.shape[1] == matrix_b.shape[0]:

    # Perform matrix multiplication
    result = np.dot(matrix_a, matrix_b)

    # Write output to text file
    np.savetxt('gt_result.txt', result)

else:
    print('Matrices cannot be multiplied!')
