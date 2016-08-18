# You are given an array of  integers, , and a positive integer, . Find and print the number of  pairs where  and  +  is evenly divisible by .
#
# Input Format
#
# The first line contains  space-separated integers,  and , respectively.
# The second line contains  space-separated integers describing the respective values of .
#
# Constraints
#
# Output Format
#
# Print the number of  pairs where  and  +  is evenly divisible by .
#
# Sample Input
#
# 6 3
# 1 3 2 6 1 2
# Sample Output
#
#  5

#!/bin/ruby

n,k = gets.strip.split(' ')
n = n.to_i
k = k.to_i
a = gets.strip
a = a.split(' ').map(&:to_i)

#n, k, and a are defined above
def divisible_sum_pairs(n,k,a)
  count = 0
  i = 0

  while (i < n)
    j = i + 1

    while (j < n)
      if ((a[i] + a[j]) % k == 0)
        count += 1
      end
      j+=1
    end

    i += 1
  end
  count
end
