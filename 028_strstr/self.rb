# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  return -1 unless haystack.include?(needle)
  return 0 if needle == ''
  haystack.chars.each_index do |i|
    return i if haystack[i..i+needle.length-1] == needle
  end
end

# puts str_str('hello', 'ello')
# puts str_str('hello', 'hello')
puts str_str('hello', 'll')
# puts str_str('', '')
# puts str_str('hello', '')
# puts str_str('', 'str')
# puts str_str('ll', 'hello')
