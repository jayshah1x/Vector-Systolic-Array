import numpy as np
import math

def dec_to_2s_comp(dec, digits):
  
  bin_str = bin(int(dec))[2:]
  
  if dec < 0:
    bin_str = bin_str.zfill(digits)
    return bin_str
  
  while len(bin_str) < digits:
    bin_str = "0" + bin_str

  return bin_str



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

# def save_blocks_to_coe_files(blocks, filename, data_width):
#     """
#     Saves blocks of a matrix to separate .coe files in binary format.

#     Args:
#         blocks: A list of 2D numpy arrays representing the blocks.
#         filename: The base filename for the saved blocks (e.g., "A").
#     """
#     for i, block in enumerate(blocks):
#         block_filename = f"{filename}{i // 2 + 1}{i % 2 + 1}.coe"
#         with open(block_filename, "wb") as f:
#             for row in block:
#                 for element in row:
#                     binary_str = twosCom_decBin(element, data_width)  # Convert to binary string
#                     binary_data = int(binary_str, 2).to_bytes(data_width // 8, byteorder="big")  # Convert to binary data
#                     f.write(binary_data)

def save_blocks_to_single_coe_file(blocks, filename, data_width):
    """
    Saves blocks of a matrix to a single .coe file in binary format,
    with the specified sub-block order.

    Args:
        blocks: A list of 2D numpy arrays representing the blocks.
        filename: The name of the .coe file to save.
    """
    with open(filename, "wb") as f:
        for i in [0, 1, 2, 3]:  # Iterate in the order A11, A12, A21, A22
            block = blocks[i]
            for row in block:
                for element in row:
                    binary_str = dec_to_2s_comp(element, data_width)
                    print(binary_str)
                    # binary_data = int(binary_str, 2).to_bytes(data_width // 8, byteorder="big")
                    f.write(binary_str)

dataWidth = 8
filename = "matA.txt"  # Replace with your actual file path
matrix = np.loadtxt(filename)
block_size = 4
# Split the matrix into blocks
blocks = split_matrix_to_blocks(matrix, block_size)

# Save blocks to .coe files
# save_blocks_to_coe_files(blocks, "A", dataWidth)

# Save blocks to a single .coe file
save_blocks_to_single_coe_file(blocks, "BRAM_A.txt", dataWidth)