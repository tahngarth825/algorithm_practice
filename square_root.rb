require "byebug"
# Implement a square root function that uses only addition, subtraction, multiplication and division
#  in less than linear time. You may assume that input is always a perfect square.
#
# Hint: One naive solution has a better time complexity than many people
# realize--iterating from 0 until the square root is going to
# be O(sqrt n), not O(n). However, we can do better!

#to make it logarithmic, we can find the middle, check that square, then
#check halfway higher or lower, etc
def log_square_root(tar, check_val = tar/2, max = tar)
  #doesn't work; checks too high of a number (tar + check_val)
  # check_val ||= tar/2

  # debugger

  if (check_val*check_val == tar)
    return check_val
  elsif (check_val*check_val < tar)
    return log_square_root(tar, (max+check_val)/2, max)
  else
    return log_square_root(tar, check_val/2, check_val)
  end
end

p log_square_root(100)


# def easy_square_root (n)
#   result = 0
#
#   until (result*result >= n)
#     result +=1
#   end
#
#   return result
# end
#
# p easy_square_root(100)
