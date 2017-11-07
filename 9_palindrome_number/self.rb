# https://leetcode.com/problems/palindrome-number/description/

# Determine whether an integer is a palindrome. Do this without extra space.

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return true if (0..9).include?(x)
  return false if x < 0

  integers = x.to_s.split('')
  is_even = integers.length % 2 == 0
  half = integers.length / 2

  if is_even
    return true if integers[0..half-1].join == integers[half..integers.length].reverse.join
  else # odd like 121
    return true if integers[0..half].join == integers[half..integers.length].reverse.join
  end
  false
end

[1,100,121,1001,123456,123454321,0,-12,-121].each do |i|
  puts is_palindrome(i)
end
