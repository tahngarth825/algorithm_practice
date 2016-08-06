require_relative 'p02_hashing'

class HashSet
  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if (@store.length == @count)
      resize!
    end

    self[key].push(key)
    @count += 1
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    self[key].delete(key)
    @count -=1
  end

  private

  def [](num)
    return @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_length = @store.length * 2
    new_set = HashSet.new(new_length)
    @store.each do |arr|
      arr.each do |el|
        new_set.insert(el)
      end
    end

    @store = new_set.store
  end
end
