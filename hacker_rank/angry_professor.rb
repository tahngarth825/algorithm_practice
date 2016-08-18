# A Discrete Mathematics professor has a class of  students. Frustrated with their lack of discipline, he decides to cancel class if fewer than  students are present when class starts.
#
# Given the arrival time of each student, determine if the class is canceled.
#
# Input Format
#
# The first line of input contains , the number of test cases.
#
# Each test case consists of two lines. The first line has two space-separated integers, (students in the class) and  (the cancelation threshold). The second line contains  space-separated integers () describing the arrival times for each student.
#
# Note: Non-positive arrival times () indicate the student arrived early or on time; positive arrival times () indicate the student arrived  minutes late.
#
# Constraints
#
# Output Format
#
# For each test case, print the word YES if the class is canceled or NO if it is not.
#
# Note
# If a student arrives exactly on time , the student is considered to have entered before the class started.
#
# Sample Input
#
# 2
# 4 3
# -1 -3 4 2
# 4 2
# 0 -1 2 1
# Sample Output
#
# YES
# NO

#!/bin/ruby
def class_cancelled?(n,k,a)
  if (k > n)
    puts "YES"
  end

  count = 0

  a.each do |num|
    if (num <= 0)
      count += 1
    end
  end

  if (count >= k)
    puts "NO"
  else
    puts "YES"
  end
end

t = gets.strip.to_i
for a0 in (0..t-1)
    n,k = gets.strip.split(' ')
    n = n.to_i
    k = k.to_i
    a = gets.strip
    a = a.split(' ').map(&:to_i)
    class_cancelled?(n,k,a)
end
