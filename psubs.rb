require 'byebug'

#gives all possible psuedo-substrings back in an array; order is maintained in letters
#ex: psubs('abc') => ['a', 'b', 'c', 'ab', 'ac', 'bc']

def psubs(str)
  return [str] if str.length <=1
  results = []

  i = 0
  until (i == str.length)
    results += [str]
    copy = str.dup
    copy.slice!(i,1)
    results += psubs(copy)
    i+=1
  end

  return results.uniq!
end

def max_psub(str)
  combos = psubs(str)
  max = str

  combos.each do |word|
    if (word > max)
      max = word
    end
  end

  return max
end

def improved_max_psub(str)
  result = str[-1]

  str.chars.reverse.each_with_index do |letter, i|
    next if (i == 0)

    if (letter >= result[0])
      result = letter + result
    end
  end

  return result
end

p improved_max_psub('yellow')
