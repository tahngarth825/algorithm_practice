require 'byebug'

## Word Chains

# Given a source word, target word and an English dictionary, transform
# the source word to target by changing/adding/removing 1 character at a
# time, while all intermediate words being valid English words. Return
# the transformation chain which has the smallest number of intermediate
# words.

def word_chains (given, target, dictionary)
  results = []
  steps = [[given.dup]]
  next_steps = []

  until (!results.empty?)
    steps.each_with_index do |word_arr, steps_idx|
      altered = word_arr.last.dup

      altered.length.times do |i|
        possible = []
        new_altered = altered.dup

        if (target[i] != altered[i])
          new_altered[i] = target[i]

          possible << new_altered

          new_altered = altered.dup
          new_altered.slice!(i,1)

          possible << new_altered
        end

        if (altered.length < target.length || target[i+1] != altered[i+1])
          new_altered = altered.dup
          new_altered.insert(i+1, target[i+1])

          possible << new_altered
        end

        possible.each do |word|
          if (dictionary.include?(word))
            next_steps.push(steps[steps_idx] + [word])
            if (word == target)
              results = next_steps.last
              return results
            end
          end
        end
      end
    end

    steps = next_steps
    next_steps = []
  end

  return results
end

p word_chains("cat", "bed", ["bat", "bet", "bed"])

p word_chains("cat", "made", ["mat", "mad", "made"])
