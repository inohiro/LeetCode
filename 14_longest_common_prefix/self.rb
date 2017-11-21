# 14. Longest Common Prefix
# https://leetcode.com/problems/longest-common-prefix/

# Write a function to find the longest common prefix string amongst an array of strings.

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return '' if strs.empty?
  strs = strs.uniq.sort_by(&:length)
  first = strs.first
  common_prefix = []

  first.chars.each_with_index do |char,i|
    # puts "current char: #{char}"
    strs.each do |str|
      # puts "current str: #{str}"
      unless str[i] == char
        return common_prefix.join
      end
    end
    common_prefix << char
  end
  common_prefix.empty? ? '' : common_prefix.join
end

strs = %w(
  aaaaab
  aaaaab
  aaab
  aaac
  aaaaac
  aaaba
  aaaabab
)
strs = %w(
  prf_a
  prf_b
  prf_c
  prf_d
  prf_
  prf_e
)
strs = [' ', ' ', '   ', ' ']
puts longest_common_prefix(strs)
