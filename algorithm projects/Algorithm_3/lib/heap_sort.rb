require_relative "heap"

class Array
  def heap_sort!
    (2..self.count).each do |i|
      BinaryMinHeap.heapify_up(self, i - 1, i)
      #heaps one element at a time
    end

    (2..self.count).to_a.reverse!.each do |i|
      temp = self[0]
      self[0] = self[i-1]
      self[i-1] = temp
      BinaryMinHeap.heapify_down(self, 0, i - 1)
      #sorts what's left of the array after taking
      #off the min and putting it at the end
      #min at end means is largest to smallest
    end

    self.reverse!
  end
end
