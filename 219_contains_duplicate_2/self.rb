# 219. Contains Duplucate II
# https://leetcode.com/problems/contains-duplicate-ii/

# Given an array of integers and an integer k, find out whether there
# are two distinct indices i and j in the array such that nums[i] =
# nums[j] and the absolute difference between i and j is at most k.

require 'pp'

# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  hash = Hash.new {|h,k| h[k] = [] }
  nums.each_with_index do |num, index|
    if hash[num].size >= 1
      hash[num].each do |n|
        puts "n: #{n}, index: #{index}, #{(n-index).abs}"
        return true if (n-index).abs <= k
      end
    end
    hash[num] << index
  end
  false
end


nums = [1,2,1] # [99,99] # [1,1,1,1,1,1,1] # [1,2,3,4,5,3,3]
k = 2 # 2 # 5 # 3
puts contains_nearby_duplicate(nums,k)
