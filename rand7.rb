# Write a method to generate a random integer `(0...7)`, given a method
# that generates a random integer between `(0...5)`. The resulting rand7
# distribution must be uniform.


# NOTE: I misread the instructions. Didn't see the triple dots indicating
# exclusive of the end value. The same logic should work; I've pulled out
# the value as row_lim that you can just change
# Create a 6x6 grid (rand5 returns 6 possible values);
# use the RNG to determine the row and column; that
# value is the random value; re-roll on specific values
# Goes 0-36; there are 8 repeating values; there are 37 total values;
# reroll on 33-36

def rand7
  row = rand5
  col = rand5

  bad_nums1 = [5]
  bad_nums2 = [2,3,4,5] #33, 34, 35, 36 respectively

  row_lim = 6 #is also a column limit

  while (bad_nums1.include?(row) && bad_nums1.include?(col))
    row = rand5
    col = rand5
  end

  grid = Array.new(row_lim){Array.new(row_lim){}}

  i = 0
  j = 0
  count = 0

  while (i < row_lim)
    j = 0
    while (j < row_lim)
      grid[i][j] = count
      count +=1
      j += 1
    end
    i += 1
  end

  return grid[row][col] % 8
end


#this is given
def rand5
  return (0..5).to_a.shuffle.first
end

20.times {p rand7}



# Doesn't work for the same reason that craps is weighted
# def rand7
#   sum = 0
#
#   7.times {sum += rand5}
#
#   if (sum == 35)
#     return rand7
#   end
#
#   return sum/5
# end
