# An implementation of http://www.geeksforgeeks.org/longest-palindrome-substring-set-1/ in Ruby

require 'pp'

def longest_palindrome(s)
  return '' unless s
  n = s.length
  return '' if n == 0
  table = Array.new(n) {Array.new(n, false)} # set true if substring i..j is palindromic

  # All sustrings of length = 1 are palindromes
  max_length = 1
  i = 0
  while i < n do
    table[i][i] = true
    i += 1
  end

  # Check for substring of length = 2
  start = 0
  i = 0
  while i < n - 1 do
    if s[i] == s[i+1]
      table[i][i+1] = true
      start = i
      max_length = 2
    end
    i += 1
  end
  
  # Check for substring length > 2
  k = 3 # length of substring
  while k <= n do
    i = 0
    while i < (n - k + 1) do # update starting index
      j = i + k - 1 # End index of substring from starting index i and length k
      if s[i] == s[j] && table[i+1][j-1]
        table[i][j] = true
        if k > max_length
          start = i
          max_length = k
        end
      end
      i += 1
    end # while i < (n-k+1)
    k += 1
  end # while k <= n

  s[start..start+max_length-1]
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

