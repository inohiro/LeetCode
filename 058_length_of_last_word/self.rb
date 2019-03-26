# https://leetcode.com/problems/length-of-last-word/
# Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word in the string.

# If the last word does not exist, return 0.

# Note: A word is defined as a character sequence consists of non-space characters only.

# Example:
#  Input: "Hello World"
#  Output: 5

# @param {String} s
# @return {Integer}
def length_of_last_word(s)
  last = s.split(' ').last
  last.nil? ? 0 : last.length
end

puts length_of_last_word('Hello World')
puts length_of_last_word('hello    world')
puts length_of_last_word('hello    world  ')
puts length_of_last_word('')
puts length_of_last_word('    ')
