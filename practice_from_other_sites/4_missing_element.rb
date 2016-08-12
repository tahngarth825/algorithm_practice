# 4. Find Missing Element
# There is an array of non-negative integers.
# A second array is formed by shuffling the elements of the
# first array and deleting a random element. Given these two arrays,
#  find which element is missing in the second array.

# NOTE We can make a hash out of the second one, then look up each element
# in the first array and return if not found.

# We could also delete from the second one given elements in the first, but
# this would have n look up for every element, which is inefficient

def missing_element(arr1, arr2)
  hash = {}

  arr2.each do |el|
    hash[el] = hash[el] ? hash[el] + 1 : 1
  end

  arr1.each do |el|
    if (!hash[el] || hash[el] == 0)
      return el
    else
      hash[el] -= 1
    end
  end

  return nil
end

p missing_element([1,2,3], [3,1])
hundred = (1..100).to_a
new_hundred = hundred.dup.shuffle
removed = new_hundred[0]
ninety_nine = new_hundred.slice(1,99)
p removed
p missing_element(hundred, ninety_nine)
p missing_element([1,1,2,3], [3,1,2])
