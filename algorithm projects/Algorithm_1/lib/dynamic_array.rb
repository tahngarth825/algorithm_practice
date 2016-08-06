require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @length = 0
    @capacity = 8
    @store = StaticArray.new(capacity)
  end

  # O(1)
  def [](index)
    if (index > @length-1)
      raise "index out of bounds"
    else
      return @store[index]
    end
  end

  # O(1)
  def []=(index, value)
    if (index > @length-1)
      raise "index out of bounds"
    else
      @store[index] = value
    end
  end

  # O(1)
  def pop
    raise "index out of bounds" unless @length > 0
    @length -= 1
    return @store[@length]
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if (@length == @capacity)
      resize!
    end
    @store[@length] = val
    @length += 1

    return @store
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" unless @length > 0

    (@length-1).times do |i|
      @store[i] = @store[i+1]
    end
    @length -= 1
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    if (@length == @capacity)
      resize!
    end

    @length +=1

    i = @length
    while (i > 0)
      @store[i] = @store[i-1]
      i-=1
    end
    @store[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity =  @capacity * 2
    result = StaticArray.new(@capacity)
    (@length-1).times do |i|
      result[i] = @store[i]
    end
    #Delete old @store
    @store = result
  end
end
