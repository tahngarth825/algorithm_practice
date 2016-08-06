class BinaryMinHeap
  def initialize(&prc)
    @store = []
    @prc = prc
  end

  def count
    @store.length
  end

  def extract
    result = @store.first
    @store[0] = @store.last
    @store.pop

    @store = BinaryMinHeap.heapify_down(@store, 0)

    return result
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)

    @store = BinaryMinHeap.heapify_up(@store, count-1)

    return @store
  end

  protected
  attr_accessor :prc, :store

  public
  def self.child_indices(len, parent_index)
    idx1 = parent_index*2 + 1
    idx2 = parent_index*2 + 2
    result = []

    if (len > idx1)
      result.push(idx1)
    end
    if (len > idx2)
      result.push(idx2)
    end

    return result
  end

  def self.parent_index(child_index)
    if (child_index == 0)
      raise "root has no parent"
    else
      return ((child_index-1)/2)
    end
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    if (prc.nil?)
      prc = Proc.new {|el1, el2| el1 < el2 ? -1 : 1}
    end

    child_idx = self.lesser_child(array, parent_idx, len, &prc)

    while (!child_idx.nil? && prc.call(array[parent_idx],array[child_idx]) > 0)
      temp = array[child_idx]
      array[child_idx] = array[parent_idx]
      array[parent_idx] = temp

      parent_idx = child_idx

      child_idx = self.lesser_child(array, parent_idx, len, &prc)
    end

    return array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    if (child_idx >= len || child_idx <= 0)
      return array
    end

    if (prc.nil?)
      prc = Proc.new {|el1, el2| el1 < el2 ? -1 : 1}
    end

    parent_idx = self.parent_index(child_idx)

    while (child_idx > 0 && prc.call(array[child_idx], array[parent_idx]) < 0)
      temp = array[parent_idx]
      array[parent_idx] = array[child_idx]
      array[child_idx] = temp

      child_idx = parent_idx
      parent_idx = self.parent_index(child_idx) unless child_idx <= 0
    end

    return array
  end

  def self.lesser_child(array, parent_idx, len, &prc)
    children = self.child_indices(len, parent_idx)

    if (children[0].nil? && children[1].nil?)
      return nil
    elsif (children[0].nil?)
      return children[1]
    elsif (children[1].nil?)
      return children[0]
    else
      return (prc.call(array[children[0]],array[children[1]]) < 0 ? children[0] : children[1])
    end
  end
end
