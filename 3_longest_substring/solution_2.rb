# An implementation Approarch #3 Sliding Window Optimized

require 'pp'

def length_of_longest_substring(str)
  length, max, i, j = str.length, 0, 0, 0
  hash = Hash.new(0)

  while j < length do
    if hash.key?(str[j])
      i = [hash[str[j]], i].max
    end
    max = [max, j-i+1].max
    hash[str[j]] = j + 1
    j += 1
    pp hash
    puts "i: #{i}, j: #{j}, max: #{max}"
  end

  pp hash
  max
end

# input = 'tmmzuxt' #=> 5
# input = ''
input = 'abcabcbb' #=> 3 ('abc')
# input = 'bbbbb' #=> 1 ('b')
# input = 'pwwkew' #=> 3 ('wke')
# input = 'kggqtmpfxewkqccehsluxmrbgcpmnwwzcdsxrhcolbbdddhmv' #=> too long

puts length_of_longest_substring(input)
