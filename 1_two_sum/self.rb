# Given an array of integers, return indices of the two numbers such that they add up to a specific target.

# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# Example:
# Given nums = [2, 7, 11, 15], target = 9,

# Because nums[0] + nums[1] = 2 + 7 = 9,
# return [0, 1].

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}

def two_sum(nums, target)
  nums.each_with_index do |num, i|
    children = nums[i+1..nums.length-1]
    children = nums[i+1..nums.length]
    children.each_with_index do |child, j|
      return [i, i+j] if num + child == target
      # return [i,i+j+1] if num + child == target
    end
  end
end

nums = [2,7,11,15]
target = 9
puts two_sum(nums, target)
