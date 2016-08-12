# Given an integer array, output all pairs that sum up to a specific value k.

# Optimized, O(n) solution for time complexity
def array_pair_sum (arr, tar)
  results = []
  numbers = {}

  arr.each do |num|
    numbers[num] = true

    if (numbers[tar-num])
      results.push([tar-num, num])
      numbers[num] = false
      numbers[tar - num] = false
    end
  end

  return results
end

# Slightly improved
# def array_pair_sum (arr, tar)
#   results = []
#   i = 0
#
#   while (i < arr.length)
#     j = i + 1
#     while (j < arr.length)
#       if (arr[i] + arr[j] == tar)
#         results.push([arr[i], arr[j]])
#       end
#       j+=1
#     end
#     i+=1
#   end
#
#   results
# end

# First attempt
# def array_pair_sum (arr, tar)
#   results = []
#
#   arr.each_with_index do |first, i|
#     arr.each_with_index do |second, j|
#       if (i != j && (first + second) == tar)
#         results.push([first, second])
#       end
#     end
#   end
#   results
# end

p array_pair_sum([1,2,4,5], 6)
