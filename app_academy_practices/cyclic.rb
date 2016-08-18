# Cyclic?
#
# Consider a linked list. Each link in the list holds a next reference to the
# next item in the list, except for the final link, which points to nil.
#
# It is possible to have a "list" without any end,
# which loops back on itself. Possibilities:
#
# A -> B -> C -> A -> ...
# A -> B -> C -> B -> ...
# Write a method cyclic?(first_link), which will return true if a list is
# cyclic. Your first version may use O(n) memory. Next, write a version which
#  uses O(1) memory; you'll probably need a different approach.

def bad_cyclic(first_link)
  link = first_link

  until (link.next == nil)
    if (link.next == first_link)
      return true
    end

    link = link.next
  end

  return false
end
