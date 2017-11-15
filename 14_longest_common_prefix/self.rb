# 14. Longest Common Prefix
# https://leetcode.com/problems/longest-common-prefix/

# Write a function to find the longest common prefix string amongst an array of strings.

require 'pp'
require 'pry'

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  strs = strs.uniq.sort

  current = 0

  strs.each do |str|
    (0..str.length-1).each do |i|
      str[0]
    end
  end

  binding.pry


  strs.each do |str|
    l = str.length
  end
end

strs = %w(
  aaab
  aaac
  aaaaac
  aaaba
  aaaabab
)
# strs = []
longest_common_prefix(strs)
