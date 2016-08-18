require "byebug"

## Fluxifying

# Describe the Flux architecture and how Flux interacts with React.
#
# The Flux cycle has four major components: Actions, Dispatcher, Store, and
# View. The view in my project was handled by React components. My Actions were
# also aided by utility actions, but overall, the structure is that a person
# will click something in the view, it will trigger an action, which
# causes the dispatcher to emit a change to let the store know, and the store
# will be restocked with the new information and update the front view
# accordingly.

## `print_spiral`

# Given a square matrix in the form of a 2D array-of-arrays, return an
# array consisting of the values of the array in "spiral order" (top row,
# then right hand side, then bottom in reverse, then up, the back
# again...).
#
#
#  1----->
#  /\    |2
#  |4    |
#  <---3\/

def print_spiral(matrix)
  rows = matrix.length
  cols = matrix[0].length

  upper_bound = 0
  right_bound = cols - 1
  lower_bound = rows - 1
  left_bound = 0

  results = []

  direction = 0
  # direction = ["right", "down", "left", "up"]

  until (upper_bound > lower_bound || left_bound > right_bound)
    next_row = []

    case direction
    when 0
      next_row = grab_row(matrix, upper_bound, left_bound, right_bound)
      upper_bound += 1
    when 1
      next_row = grab_col(matrix, right_bound, upper_bound, lower_bound)
      right_bound -= 1
    when 2
      next_row = grab_row(matrix, lower_bound, left_bound, right_bound, true)
      lower_bound -= 1
    when 3
      next_row = grab_col(matrix, left_bound, upper_bound, lower_bound, true)
      left_bound += 1
    end

    results.push(next_row)
    direction = (direction+1)%4
  end

  return results
end

def grab_row(matrix, row, left_bound, right_bound, reverse = false)
  results = []

  (left_bound..right_bound).each do |i|
    results << matrix[row][i]
  end

  if (reverse)
    return results.reverse
  else
    return results
  end
end

def grab_col(matrix, col, upper_bound, lower_bound, reverse = false)
  results = []

  (upper_bound..lower_bound).each do |i|
    results << matrix[i][col]
  end

  if (reverse)
    return results.reverse
  else
    return results
  end
end

p print_spiral([[1,2],[3,4]])
p print_spiral([[1,2,3],[4,5,6],[7,8,9]])
