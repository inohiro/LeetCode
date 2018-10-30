# 11. Container With Most Water
# https://leetcode.com/problems/container-with-most-water/

# Given n non-negative integers a1, a2, ..., an, where each represents
# a point at coordinate (i, ai). n vertical lines are drawn such that
# the two endpoints of line i is at (i, ai) and (i, 0). Find two
# lines, which together with x-axis forms a container, such that the
# container contains the most water.

# Note: You may not slant the container and n is at least 2.

require 'pp'
require 'pry'

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  hash = {}
  # ary = []
  height.each_with_index do |h,i|
    #hash.store(h, i)
    hash.store(i,h)
  end
  top1, top2 = hash.sort_by {|k,v| v }.reverse[0..1]

  pp hash
  puts "top1: #{top1}"
  puts "top2: #{top2}"

  h = top2[1]
  w = (top1[0] - top2[0]).abs
  puts "h: #{h}, w: #{w}"
  h*w
end

# ary = [1,1] #=> 1
# ary = [2,2] #=> 2
# ary = [3,2,5] #=> 6
# ary = [128, 2437, 32, 33, 321, 2344, 98, 99, 0, 0]
# ary = [0,0]
ary = [1,2,1] #=> 2
puts max_area(ary)
