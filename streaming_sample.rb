## `streaming_sample`

You know how to use `rand` to randomly sample an element from an
array.

Now, write a function that, given an input stream of objects, will
sample a value. The stream has limited length.

* Use only `O(1)` memory.
* Every value in the stream should have an equal probability of being
  sampled.


# After looking at the solution and trying it on my own after
def sample_stream(stream)
  current_item = stream.next
  chosen = current_item.value
  count = 1

  until (current_item.next.nil?)
    current_item = current_item.next
    count += 1

    if ( rand < 1.0/count )
      chosen = current_item.value
    end
  end

  return chosen
end

# Attempt 1: Apparently I misunderstood the problem
# def sample_stream(stream)
#   count = stream.length
#
#   return stream[rand(count)]
# end

# Initial thoughts:
# I plan to keep count of the number of objects coming in, as well as keep
# count of the values coming in by appending an integer
