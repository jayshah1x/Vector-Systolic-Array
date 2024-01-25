import numpy as np

def split_matrix_to_blocks(matrix, block_size):
 """
 Splits a matrix into sub-matrices of a given block size.

 Args:
   matrix: A 2D numpy array representing the matrix to be split.
   block_size: An integer representing the size of the sub-matrices.

 Returns:
   A list of 2D numpy arrays representing the sub-matrices.
 """
 rows, cols = matrix.shape
 n_blocks_row = int(np.ceil(rows / block_size))
 n_blocks_col = int(np.ceil(cols / block_size))
 blocks = []
 for i in range(n_blocks_row):
   for j in range(n_blocks_col):
     row_start = i * block_size
     row_end = min((i + 1) * block_size, rows)
     col_start = j * block_size
     col_end = min((j + 1) * block_size, cols)
     block = matrix[row_start:row_end, col_start:col_end]
     blocks.append(block)
 return blocks

def save_blocks_to_files(matrix, block_size, filename):
 """
 Splits a matrix into blocks, saves each block to a separate text file.

 Args:
   matrix: A 2D numpy array representing the matrix to be split.
   block_size: An integer representing the size of the sub-matrices.
   filename: The base filename for the saved blocks (e.g., "A").
 """
 blocks = split_matrix_to_blocks(matrix, block_size)
 for i, block in enumerate(blocks):
   block_filename = f"{filename}{i // 2 + 1}{i % 2 + 1}.txt"
   np.savetxt(block_filename, block, fmt="%d")

# Example usage
filename = "matA.txt"  # Replace with your actual file path
matrix = np.loadtxt(filename)
block_size = 4
# save_blocks_to_files(matrix, block_size, "A")
blocks = split_matrix_to_blocks(matrix, block_size)
print(blocks)
