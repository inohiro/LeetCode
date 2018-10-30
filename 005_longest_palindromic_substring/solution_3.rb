# An implementation of https://discuss.leetcode.com/post/169359 in Ruby

require 'pp'

def longest_palindrome(s)
  l = s.length
  return s if l < 2

  min_start = 0
  max_len = 1
  i = 0
  
  while i < l do
    break if (l - i) <= max_len / 2
    j = i
    k = i
    while k < l - 1 && s[k+1] == s[k] do
      k += 1
    end
    i = k + 1
    while k < l -1 && j > 0 && s[k+1] == s[j-1] do
      k += 1
      j -= 1
    end
    new_len = k - j + 1
    if (new_len > max_len)
      min_start = j
      max_len = new_len
    end
  end

  s[min_start, min_start + max_len]
end

sl, sl2 = [], []
498.times {|i|
  sl << 'ab'
  sl2 << 'a'
}
sl << 'a'
sl2 = [sl2, 'b', sl2]

# (%w(babadada a abcda babad cbbd abcdefedcba ababba) + ['', sl.join, sl2.join]).each do |s|
%w(babadada a abcda babad cbbd abcdefedcba ababba).each do |s|
  puts '-------------------------------'
  puts s
  puts longest_palindrome(s)
end

