# Given a set, , of  distinct integers, print the size of a maximal subset, , of  where the sum of any  numbers in  are not evenly divisible by .
#
# Input Format
#
# The first line contains  space-separated integers,  and , respectively.
# The second line contains  space-separated integers (we'll refer to the  value as ) describing the unique values of the set.
#
# Constraints
#
# All of the given numbers are distinct.
# Output Format
#
# Print the size of the largest possible subset ().
#
# Sample Input
#
# 4 3
# 1 7 2 4
# Sample Output
#
# 3

n,k = gets.strip.split(' ')
n = n.to_i
k = k.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)

largest_set = 0

def non_divisible_subset(n, k, a, i=0, subset = [])
  # base case return a if a.length <= 1

  #check if can add into the subset
  try1 = non_divisible_subset(n, k, i+1, subset + [a[i]] )

  #try it without adding it into the subset
  try2 = non_divisible_subset(n, k, i+1, subset)

  #compare with the largest_set and change if largest
end
