# Given a binary tree, write a function to check whether it’s a binary
# search tree or not.
  -> 3
2
  -> 1

  -> 1
2
  -> 3

def is_bst?(node)
  rows = []
  row_num = 1
  current_row = [node]

  until (current_row.empty?)
    next_row = []
    current_row.each do |node|
      if (check_kids(node) == false)
        return false
      end

      next_row.concat(add_kids(node))
    end

    rows.concat(current_row)
    current_row = next_row.dup
  end

  return true
end

def add_kids(node)
  results = []
  if (node.left)
    results << node.left
  end
  if (node.right)
    results << node.right
  end

  return results
end

def check_kids(node)
  if (node.right)
    if (node.right.value < node.value)
      return false
    end
  end
  if (node.left)
    if (node.left.value > node.value)
      return false
    end
  end
  return true
end
