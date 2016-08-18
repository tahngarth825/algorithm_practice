## `duplicates` (from LeanData)

# Write a method that takes an array and returns its duplicate values. Use less than O(n*n) time.

def duplicates(arr)
  duplicates = []
  store = Hash.new(0)

  arr.each do |el|
    if (store[el] == 1)
      duplicates.push(el)
      store[el] += 1
    elsif (store[el] == 0)
      store[el] = 1
    else
      store[el] += 1
    end
  end

  return duplicates
end

p duplicates([1,1,2,3,4,4,5,5,5])
