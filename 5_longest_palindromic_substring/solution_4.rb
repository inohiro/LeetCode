# An Implementation of https://discuss.leetcode.com/post/23533 in Ruby
# But, input 'cbbd', output will be 'bbd'

def longest_palindrome(s)
  l = s.length
  return s if l < 2

  res = s[0]
  i = 0
  current_length = 0

  while i < l do
    if palindrome?(s, i - current_length - 1, i)
      res = s[i-current_length-1, i+1]
      current_length += 2
    elsif palindrome?(s, i-current_length, i)
      res = s[i-current_length, i+i]
      current_length += 1
    end
    i += 1
  end
  res
end

def palindrome?(s, _begin, _end)
  return false if _begin < 0
  while _begin < _end do
    return false if s[_begin] != s[_end]
    _begin += 1
    _end -= 1
  end
  true
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

