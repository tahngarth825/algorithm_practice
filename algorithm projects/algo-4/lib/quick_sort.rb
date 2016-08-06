class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    if (array.length <= 1)
      return array
    end

    pivot = 0
    value = array[pivot]
    mid = []
    left_arr = []
    right_arr = []

    array.length.times do |i|
      if (array[i] < value)
        left_arr << array[i]
      elsif (array[i] > value)
        right_arr << array[i]
      else
        mid << array[i]
      end
    end

    return QuickSort.sort1(left_arr) + mid + QuickSort.sort1(right_arr)
  end



  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return start if length < 2

    right_start = self.partition(array, start, length - start, &prc) + 1

    #left-side
    QuickSort.sort2!(array, start, right_start - start, &prc)

    QuickSort.sort2!(array, right_start, length - right_start)

    return array
  end



  def self.partition(array, start, length, &prc)
    if (start + length > array.length)
      raise "Start plus length out of bounds"
    elsif (prc.nil?)
      prc = Proc.new { |el1, el2| el1 <=> el2 }
    end

    pivot = start
    index = start
    value = array[pivot]

    while (index < start+length)
      if (prc.call(array[index],value) < 0)
        array[index], array[pivot+1] = array[pivot+1], array[index]
        array[pivot], array[pivot+1] = array[pivot+1], array[pivot]
        pivot += 1
      end
      index +=1
    end
    return pivot
  end
end
