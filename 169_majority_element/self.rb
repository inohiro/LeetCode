# 169. Majority Element
# https://leetcode.com/problems/majority-element/

# Given an array of size n, find the majority element. The majority element is the element that appears more than [n/2] times.

# You may assume that the array is non-empty and the majority element always exist in the array.

require 'pp'

# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  hash = Hash.new {0}
  nums.each do |num|
    hash[num] += 1
  end
  hash.sort_by {|k,v| v }.reverse.first.first
end

nums = [1,2,2,3,3,3,4,4,4,4,5,5,5,5,5,6]
pp majority_element(nums)
