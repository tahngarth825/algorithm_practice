#next_largest

# Given a node in a Binary Search Tree, find the node with the next largest value.
# Assume you don't have the root of the tree, just a single node from it.

# If there is a child to the right, then it is the next largest
# Otherwise, go up-right; if no such node, then go up-left until you can go up-right.
# If you cannot, then there does not exist a next-largest number.
# If you can go up-right, check if larger. If not, go more up-right.
# If it is larger, check if bottom left is larger than original. If so, go bottom-left.
# If not, then you're at right node. Once go bottom left, check if bottom left is still
# larger than original. Keep going until not larger.

def next_largest(node)
  if (node.right != nil)
    return node.right
  end

  next_node = node.parent

  until (next_node == nil || next_node.value > node.value)
    next_node = next_node.parent
  end

  if (next_node == nil)
    until (next_node.right == nil || next_node.value > node.value)
      next_node = next_node.right
    end
  end

  if (next_node == nil)
    return nil
  end

  until (next_node.left == nil || next_node.left.value < node.value)
    next_node = next_node.left
  end

  return next_node
end
