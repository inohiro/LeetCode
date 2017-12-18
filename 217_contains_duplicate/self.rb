# 217. Contains Duplicate
# https://leetcode.com/problems/contains-duplicate/

# Given an array of integers, find if the array contains any duplicates. Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.

# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  hash = {}
  
  nums.each do |num|
    if hash[num]
      return true
    else
      hash[num] = true
    end
  end
  false
end

# nums = []
nums = [1,1,2,3,4,5]
puts contains_duplicate(nums)
