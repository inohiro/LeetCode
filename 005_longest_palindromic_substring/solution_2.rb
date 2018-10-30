# An implementation of Approach #3 (Dynamic Programming)
# http://miti-7.hatenablog.com/entry/2016/03/14/195721
# but it looks store length of longest palindromic substring

require 'pp'

def longest_palindrome(s)
  n = s.length
  i, j = 0, 0
  # memo = Hash.new {|h,k| h[k] = Hash.new(0) }
  memo = Array.new(n+1, 0).map { Array.new(n, 0) }
  # pp memo
  (2..n+1).each do |j|
    (0..n-j+1).each do |i|
      if s[i] == s[i+j-1]
        memo[i][j] = memo[i+1][j-2]+2
      else
        memo[i][j] = [memo[i][j-1], memo[i+1][j-1]].max
      end
    end
  end

  pp memo
  memo[0][-1]
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
  puts s
  puts longest_palindrome(s)
end
