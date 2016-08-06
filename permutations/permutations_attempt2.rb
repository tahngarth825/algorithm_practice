def permutations(arr)
  return arr if arr.length <= 1

  results = [[arr[0]]]

  arr.each_with_index do |el, i|
    next if i == 0
    results = permute(el, results)
  end

  return results
end

def permute(el, arr)
  sub_results = []

  arr.each do |sub_arr|
    (sub_arr.length+1).times do |i|
      copy = sub_arr.dup
      copy.insert(i, el)
      sub_results << copy
    end
  end

  return sub_results
end

p permutations([1,2,3])
