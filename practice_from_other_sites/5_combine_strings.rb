require 'byebug'
# 6. Combine Two Strings
# We are given 3 strings: str1, str2, and str3. Str3 is said to be a shuffle
# of str1 and str2 if it can be formed by interleaving the characters of str1
# and str2 in a way that maintains the left to right ordering of the characters
# from each string. For example, given str1=”abc” and str2=”def”, str3=”dabecf”
# is a valid shuffle since it preserves the character ordering of the two strings.
#  So, given these 3 strings write a function that detects whether str3 is a
#   valid shuffle of str1 and str2.

def combine_strings(str1, str2, str3)
  return false if str1.length + str2.length != str3.length

  i1 = 0
  i2 = 0
  i3 = 0

  #oops, totally forgot to use the letter
  while (i3 < str3.length)
    if (str1[i1] == str2[i2])
      sub_str1 = str1.slice(i1, str1.length-i1)
      sub_str2 = str2.slice(i2, str2.length-i2)
      sub_str3 = str3.slice(i3, str3.length-i3)

      if (!combine_strings(sub_str1.slice(1, sub_str1.length-1), sub_str2, sub_str3.slice(1, sub_str3.length-1)) &&
        !combine_strings(sub_str1, sub_str2.slice(1, sub_str2.length-1), sub_str3.slice(1, sub_str3.length-1)))
        debugger
        # isn't shortening that first string of length 1
        # p combine_strings(sub_str1.slice(1, sub_str1.length-1), sub_str2, sub_str3.slice(1, sub_str3.length-1))
        # p combine_strings(sub_str1, sub_str2.slice(1, sub_str2.length-1), sub_str3.slice(1, sub_str3.length-1))
        return false
      end

    elsif (str1[i1] == str3[i3])
      i1 += 1
      i3 += 1
    elsif (str2[i2] == str3[i3])
      i2 += 1
      i3 += 1
    else
      return false
    end
  end

  return true
end

p combine_strings("cat", "dog", "cdoatg") #true
p combine_strings("cat", "dog", "adoctg") #false
p combine_strings("cc", "cd", "cdcc") #true
