# 3. Largest Continuous Sum
# Given an array of integers (positive and negative) find the largest continuous sum.

def largest_contiguous_sum(arr)
  largest_sum = nil
  running_sum = nil

  return if arr.empty?

  arr.each do |el|
    if ((running_sum.nil? || running_sum < 0) && el > 0)
      running_sum = el
    else
      running_sum += el
    end

    if (largest_sum.nil? || running_sum > largest_sum)
      largest_sum = running_sum
    end
  end

  return largest_sum
end

p largest_contiguous_sum([10,1,-7,10])
p largest_contiguous_sum([10,1,-7,2,5,-8,-30])
p largest_contiguous_sum([10,1,-7,2,5,-8,-30, 100])
