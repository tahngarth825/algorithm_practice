require 'byebug'
## `median`

# Given two **sorted** arrays, find the median element amongst the two
# arrays. That is, if both arrays were combined, find the median element
# from the combined array. Assume that there is not enough memory to
# actually combine both arrays. There exists an O(log n + log m)
# solution.

def median(arr1, arr2)
  mid = (arr1.length + arr2.length)/2.0

  if (arr1.last < arr2.first)
    mid2 = mid-arr1.length

    if (mid2 == mid2.to_i)
      return arr2[mid2]
    else
      return (arr2[mid2 - 0.5] + arr2[mid2 + 0.5])/2.0
    end

  elsif (arr1.first > arr2.last)
    mid1 = mid-arr2.length

    if (mid1.to_i == mid1)
      return arr1[mid1]
    else
      return (arr1[mid1 - 0.5] + arr1[mid1 + 0.5])/2.0
    end

  else
    # mid1 = arr1.length/2.0
    # mid2 = arr2.length/2.0
    # upper_mid1 = 0
    # lower_mid1 = 0
    # upper_mid2 = 0
    # lower_mid2 = 0
    #
    # if (mid1.to_i != mid1)
    #   upper_mid1 = mid1+0.5
    #   lower_mid1 = mid1-0.5
    # else
    #   lower_mid1 = upper_mid1 = mid1
    # end
    #
    # if (mid2.to_i != mid2)
    #   upper_mid2 = mid2+0.5
    #   lower_mid2 = mid2-0.5
    # else
    #   lower_mid2 = upper_mid2 = mid2
    # end
    #
    # until ((upper_mid2 == arr2.length || arr1[upper_mid1] < arr2[upper_mid2 + 1]) &&
    #   (lower_mid2 == 0 || arr1[lower_mid1] > arr2[lower_mid1 - 1]) &&
    #   (upper_mid1 == arr1.length || arr2(upper_mid2) < arr1[upper_mid1 + 1]) &&
    #   (lower_mid1 == 0 || arr2[lower_mid2] > arr1[lower_mid2 - 1]) )
    #
    #
    # end
    #
    # mid_val1 = 0
    # mid_val2 = 0
    #
    # if (upper_mid1 == lower_mid1)
    #   if (upper_mid2 == lower_mid2)
    #     return (arr1[upper_mid1] + arr2[upper_mid2])/2.0
    #   else
    #     return arr1[upper_mid1]
    #   end
    # elsif (upper_mid2 == lower_mid2)
    #   return arr2[upper_mid2]
    # else
    #   # might be wrong
    #   # Need to check if one range is encapsulated in the other, or if
    #   # they just overlap; if encapsulated, then median is taken from that
    #   # if (upper_mid1 < upper_mid2)
    #   #   mid_val1 =
    # end
  end
end

p median([0,3,12],[1,2,5,6,9,11])
