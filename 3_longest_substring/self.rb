# Given a string, find the length of the longest substring without repeating characters.

# Examples:

# Given "abcabcbb", the answer is "abc", which the length is 3.
# Given "bbbbb", the answer is "b", with the length of 1.
# Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

require 'pp'
require 'pry'

def length_of_longest_substring(str)
  return 0 if str.nil? or str == ''
  hash = Hash.new(0)
  chars = str.chars
  chars.each_with_index do |char, index|
    substr = []
    chars[index..chars.length].each_with_index do |sub_char, j|
      substr << sub_char
      if substr.join.length == substr.uniq.join.length
        hash[substr.join] += 1
      end
    end
  end
  pp hash
  hash.map {|k,v| k.length}.max
end

# input = 'tmmzuxt' #=> 5
# input = ''
# input = 'abcabcbb' #=> 3 ('abc')
# input = 'bbbbb' #=> 1 ('b')
# input = 'pwwkew' #=> 3 ('wke')
input = 'kggqtmpfxewkqccehsluxmrbgcpmnwwzcdsxrhcolbbdddhmv' #=> too long

puts length_of_longest_substring(input)
