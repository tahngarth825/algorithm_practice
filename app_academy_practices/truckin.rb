# Given a fleet of 50 trucks, each with a full fuel tank and a range of 100 miles,
#  how far can you deliver a payload? You can transfer the payload from truck to
#  truck, and you can transfer fuel from truck to truck. Assume all the payload
#  will fit in one truck.

# Description: Once your 50 trucks have gone 2 miles, there are 100 miles of
# missing gas; you can redistribute this gas to the other remaining 49 trucks
# to full gas so you don't waste gas driving an extra truck. Continue until empty.

#trucks is number of trucks; distance is distance each will go on full tank
def trucking(trucks, distance)
  running_sum = 0

  current_sum = 0

  while (trucks > 0)
    #strictly greater than is 432. Greater than or equal to is 482.
    #actual answer is around 450. Could add with smaller increments and not
    #use integers
    until (current_sum > distance/trucks)
      current_sum += 1
      running_sum += 1
    end

    current_sum = 0
    trucks -= 1
  end

  return running_sum
end

p trucking(50,100)
