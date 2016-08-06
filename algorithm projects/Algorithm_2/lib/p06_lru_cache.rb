require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if (@map.include?(key))
      update_link!(@map[key])
    else
      calc!(key)
    end
    return @map[key].val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    value = @prc.call(key)

    if (@map.count == @max)
      eject!
    end

    @map[key] = @store.insert(key,value)
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    key = link.key
    value = link.val
    @store.remove(key)
    @store.insert(key, value)
  end

  def eject!
    deleted_key = @store.first.key
    @store.remove(deleted_key)
    @map.delete(deleted_key)
  end
end
