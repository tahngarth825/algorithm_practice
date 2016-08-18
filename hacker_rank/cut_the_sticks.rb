# You are given  sticks, where the length of each stick is a positive integer. A cut operation is performed on the sticks such that all of them are reduced by the length of the smallest stick.
#
# Suppose we have six sticks of the following lengths:
#
# 5 4 4 2 2 8
# Then, in one cut operation we make a cut of length 2 from each of the six sticks. For the next cut operation four sticks are left (of non-zero length), whose lengths are the following:
#
# 3 2 2 6
# The above step is repeated until no sticks are left.
#
# Given the length of  sticks, print the number of sticks that are left before each subsequent cut operations.
#
# Note: For each cut operation, you have to recalcuate the length of smallest sticks (excluding zero-length sticks).
#
# Input Format
# The first line contains a single integer .
# The next line contains  integers: a0, a1,...aN-1 separated by space, where  represents the length of the  stick.
#
# Output Format
# For each operation, print the number of sticks that are cut, on separate lines.
#
# Constraints
#
# Sample Input 0
#
# 6
# 5 4 4 2 2 8
# Sample Output 0
#
# 6
# 4
# 2
# 1
# Sample Input 1
#
# 8
# 1 2 3 4 3 3 2 1
# Sample Output 1
#
# 8
# 6
# 4
# 1

#!/bin/ruby

n = gets.strip.to_i
arr = gets.strip
arr = arr.split(' ').map(&:to_i)


def cut_the_sticks(n, arr)
  count = n

  arr = arr.sort

  while (count > 0)
    puts count

    shortest = arr[0]
    new_arr = []

    arr.each do |el|
      new_el = el - shortest
      new_arr.push(new_el) if new_el > 0
    end

    arr = new_arr
    count = arr.length
  end
end

cut_the_sticks(n, arr)
