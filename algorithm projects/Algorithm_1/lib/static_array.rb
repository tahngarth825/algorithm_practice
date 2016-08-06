# This class just dumbs down a regular Array to be staticly sized.
class StaticArray
  def initialize(length = 0)
    @store = Array.new(length)
  end

  # O(1)
  def [](index)
    if (index >= @store.length || index < 0)
      raise "index out of bounds"
    else
      return @store[index]
    end
  end

  # O(1)
  def []=(index, value)
    if (index >= @store.length || index < 0)
      raise "index out of bounds"
    else
      @store[index] = value
    end
  end

  protected
  attr_accessor :store
end
