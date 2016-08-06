class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList

  include Enumerable

  def initialize
    @head = nil
    @tail = nil
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head.nil?
  end

  def get(key)
    self.each {|link| return link.val if link.key == key}
    nil
  end

  def include?(key)
    !!get(key)
  end

  def insert(key, val)
    if (@head.nil?)
      @head = Link.new(key, val)
      @tail = @head
    else
      @tail.next = Link.new(key, val)
      @tail.next.prev = @tail
      @tail = @tail.next
    end

    return @tail
  end

  def remove(key)
    link = get_link(key)

    if (link == @head)
      if(link == @tail)
        @head = nil
        @tail = nil
      else
        link.next.prev = nil
        @head = link.next
      end
    elsif (link == @tail)
      link.prev.next = nil
      @tail = link.prev
    else
      link.prev.next = link.next
      link.next.prev = link.prev
    end
  end

  def each(&prc)
    link = @head

    until (link == nil)
      prc.call(link)

      link = link.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end

  private
  attr_accessor :head, :tail

  def get_link(key)
    self.each {|link| return link if link.key == key}
    nil
  end
end
