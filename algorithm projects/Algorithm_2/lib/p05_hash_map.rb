require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count, :store

  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[bucket(key)].include?(key)
  end

  def set(key, val)
    if (@count == num_buckets)
      resize!
    end

    if (@store[bucket(key)].include?(key))
      @store[bucket(key)].remove(key)
    end

    @store[bucket(key)].insert(key,val)
    @count +=1
  end

  def get(key)
    @store[bucket(key)].get(key)
  end

  def delete(key)
    @store[bucket(key)].remove(key)
    @count -= 1
  end

  def each(&prc)
    @store.each do |linked_list|
      linked_list.each do |node|
        prc.call(node.key, node.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_length = @store.length * 2
    new_hash = HashMap.new(new_length)
    @store.each do |linked_list|
      linked_list.each do |node|
        new_hash.set(node.key, node.val)
      end
    end

    @store = new_hash.store
  end

  def bucket(key)
    return key.hash % num_buckets
  end
end
