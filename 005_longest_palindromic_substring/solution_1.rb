# An implementation of Approach #4 (Expand Around Center)

def longest_palindrome(s)
  puts "=============================="
  _start, _end = 0, 0
  s.chars.each_with_index do |char, i|
    len1 = expand_around_center(s, i, i)
    len2 = expand_around_center(s, i, i + 1)
    len = [len1, len2].max
    puts "len1: #{len1}, len2: #{len2}"
    if len > _end - _start
      _start = i - (len - 1) / 2
      _end = i + len / 2
    end
  end
  s[_start.._end+1]
end

def expand_around_center(s, left, right)
  l, r = left, right
  puts '------------------------------'
  puts "l: #{l}, r: #{r}"
  while l >= 0 && r < s.length && s[l] == s[r] do
    l -= 1
    r += 1
  end
  puts "l: #{l}, r: #{r}"  
  r - l - 1
end

sl = []
# 498.times {|i| sl << 'ab' }
sl << 'a'
sl2 = []
# 1000.times {|i| sl2 << 'a' }

(%w(babadada a abcda babad cbbd abcdefedcba ababba) + ['', sl.join, sl2.join]).each do |s|
  puts longest_palindrome(s)
end


