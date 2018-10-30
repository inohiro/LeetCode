# https://leetcode.com/problems/longest-palindromic-substring/

# Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.

# Example:
#  Input: "babad"
#  Output: "bab"
#  Note: "aba" is also a valid answer.

# Example:
#  Input: "cbbd"
#  Output: "bb"

# @param {String} s
# @return {String}
def longest_palindrome(s)
  # puts "--------------------------"
  # puts s
  return s if s.length < 2
  chars = s.chars
  l = chars.length
  i, j = 0, l - 1
  max = [s[0]]

  while i < l - 1 do # && j < l do
    if j - i >= max.length
      # puts "i: #{i}, j: #{j}, l: #{l}"
      # puts "i: #{chars[i]}, j: #{chars[j]}"
      if chars[i] == chars[j]
        substr = chars[(i..j)]
        # puts "substr: #{substr.join}"      
        if substr == substr.reverse && substr.length > max.length
          # puts "swap! max: #{max.join} <=> substr: #{substr.join}"
          max = substr
        end
      end
    end
    j -= 1
    if j == i
      i += 1
      j = l - 1
    end
  end
  max.join
end

sl = []
498.times {|i| sl << 'ab' }
sl << 'a'
sl2 = []
1000.times {|i| sl2 << 'a' }

(%w(babadada a abcda babad cbbd abcdefedcba ababba) + ['', sl.join, sl2.join]).each do |s|
  puts longest_palindrome(s)
end
