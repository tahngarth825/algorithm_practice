## `choose_a_record` (also LeanData)

# Write a method that takes a hash of symbol keys, for which the values are
# integers representing each key's weight. The method returns a key such that the
# chances of selecting a particular key are weighted by that key's value.

# For the hash {:a => 1, :b => 2, :c => 3}, the chance of returning :c is 1/2, :b is 1/3, and :a is 1/6.

# It seems like it works, but i am not 100% sure?

def choose_a_record(hash)
  sum = 0
  running_chance = 0

  hash.each do |key, value|
    sum += value
  end

  chance = rand(sum + 1)

  hash.each do |key, value|
    running_chance += value
    if (running_chance >= chance)
      return key
    end
  end
end

6.times {p choose_a_record({a: 100, b: 2, c: 3})}
