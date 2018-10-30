# An implementation of http://algoogle.hadrori.jp/aoj/2035/ in ruby
# does not run, too complicated...

require 'pp'

@dp = nil
@to = nil
@str = ''

def rec(l, r)
  # ret = @dp[l][r]
  return @dp[l][r] if @dp[l][r] # ?
  if l == r
    @dp[l][r] = 1
    return
  elsif l > r
    @dp[l][r] = 0
    return
  end
  if @str[l] == @str[r]
    @to[l][r] = 3
    @dp[l][r] = rec(l+1, r-1)+2
    return
  end
  a = rec(l+1, r)
  b = rec(l, r-1)
  if a > b
    @to[l][r] = 1
    @dp[l][r] = a
    return
  end
  @to[l][r] = 2
  @dp[l][r] = b
  return
end

def longest_palindrome(s)
  @str = s
  @dp = Array.new(@str.length, Array.new(@str.length, -1))
  @to = Array.new(@str.length, Array.new(@str.length, -1))

  l = 0
  r = s.length - 1
  nl = 0
  nr = 0
  rec(l, r)
  pp @dp
  x = ''
  y = ''
  while l < r do
    nl = 1
    nr = r
    x << @str[l] if @to[l][r] == 3
    nl += 1 if @to[l][r] == 1
    nr -= 1 if @to[l][r] == 2
    l = nl
    r = nr
  end
  y = x
  x << @str[l] if l == r
  x + y
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

