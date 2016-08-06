require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @length = 0
    @start_idx = 0
    @capacity = 8
    @store = StaticArray.new(capacity)
  end

  # O(1)
  def [](index)
    if (index > @length-1)
      raise "index out of bounds"
    else
      return @store[check_index(index)]
    end
  end

  # O(1)
  def []=(index, val)
    if (index > @length-1)
      raise "index out of bounds"
    else
      @store[check_index(index)] = val
    end
  end

  # O(1)
  def pop
    raise "index out of bounds" unless @length > 0
    @length -= 1
    return @store[check_index(@length)]
  end

  # O(1) ammortized
  def push(val)
    if (@length == @capacity)
      resize!
    end

    @store[check_index(@length)] = val
    @length += 1

    return @store
  end

  # O(1)
  def shift
    raise "index out of bounds" unless @length > 0

    result = @store[@start_idx]

    @start_idx = check_index(1)

    @length -= 1

    return result
  end

  # O(1) ammortized
  def unshift(val)
    if (@length == @capacity)
      resize!
    end

    @store[check_index(-1)] = val

    @start_idx = check_index(-1)

    @length +=1

    return @store
  end

  # protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    return (@start_idx + index) % @capacity
  end

  def resize!
    temp_capacity = @capacity * 2
    result = StaticArray.new(temp_capacity)

    @length.times do |i|
      result[i] = @store[check_index(i)]
    end

    @capacity = temp_capacity
    @store = result
    @start_idx = 0
  end
end
