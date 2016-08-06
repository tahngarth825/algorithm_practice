require 'byebug'

#takes an array and returns all possible permutations
#ex: [1,2,3] => [[1,2,3],[2,3,1], [3,2,1], [1,3,2]... 3! = 6 of them]
# if three elements, can choose any one for first, element (3), then choose any remainder
# for second (2), then arbitrary which is last

def permutations(arr)
  if (arr.length <= 1)
    return arr
  end
  results = [[arr[0]]]

  arr.length.times do |i|
    next if i == 0
    results = permute_calc(arr[i], results)
  end

  return results
end

# arr is an array of arrays
#inserts el in every slot available and returns all possible inserts
def permute_calc(el, arr)
  sub_results = []

  arr.each do |sub_arr|
    (sub_arr.length + 1).times do |i|
      copy = sub_arr.dup
      copy.insert(i,el)
      sub_results << copy
    end
  end

  return sub_results
end

p permutations([1,2,3])
