# An implementation Approarch #2 Sliding Window in Ruby

require 'pp'

def length_of_longest_substring(str)
  length, max, i, j = str.length, 0, 0, 0
  hash = {} # Hash.new(0)

  while i < length && j < length do
    pp hash
    unless hash.key?(str[j])
      hash[str[j]] = nil
      j += 1
      max = [max, j-i].max
    else
      hash.delete(str[i])
      i+= 1
    end
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
