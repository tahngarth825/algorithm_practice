require 'byebug'

# 2. Matrix Region Sum
# Given a matrix of integers and coordinates of a rectangular region within
# the matrix, find the sum of numbers falling inside the rectangle. Our program
# will be called multiple times with different rectangular regions from the same matrix.

def matrix_region_sum(matrix, coord_arr)
  top = coord_arr[0][0]
  left = coord_arr[0][1]
  bottom = coord_arr[1][0]
  right = coord_arr[1][1]

  sum = 0

  i = top

  while (i <= bottom)
    j = left
    while (j <= right)
      sum += matrix[i][j]
      j += 1
    end
    i += 1
  end

  return sum
end


matrix = [[1,2,3], [4,5,6], [7,8,9]]
coords1 = [[1,1], [2,2]]
coords2 = [[1,1], [1,2]]
coords3 = [[0,0], [2,2]]

p matrix_region_sum(matrix, coords1)
p matrix_region_sum(matrix, coords2)
p matrix_region_sum(matrix, coords3)
