# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x < 0
  return false if x % 10 == 0 && x != 0

  reverted_number = 0
  while x > reverted_number do
    reverted_number = reverted_number * 10 + x % 10
    x /= 10
  end

  x == reverted_number or x == reverted_number / 10
end

[1,100,121,1001,123456,123454321,0,-12,-121].each do |i|
  puts "#{i}\t: #{is_palindrome(i)}"
end
