# 136. Single Number
# https://leetcode.com/problems/single-number/

# Given an array of integers, every element appears twice except for one. Find that single one.

require 'pp'

# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  return 0 if nums.empty?
  return nums.first if nums.length == 1
  hash = {}
  nums.each do |i|
    hash[i] ? hash.delete(i) : hash[i] = true
  end
  hash.keys.length > 0 ? hash.keys.first : 0
end

nums = []
nums = [1]
nums = [1,1,9,2,2,3,3,4,4,5,5]
puts single_number(nums)
