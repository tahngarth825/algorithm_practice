class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    self.each_with_index do |el, idx|
      result += el.hash*(idx+1)
    end
    result *= self.length
    return result
  end
end

class String
  def hash
    arr = []
    self.each_byte do |char|
      arr.push(char)
    end
    return arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.each do |key, val|
      result += key.to_s.hash + val.to_s.hash
    end

    return result
  end
end
