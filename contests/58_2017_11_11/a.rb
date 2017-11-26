# 724. Find Pivot Index
# https://leetcode.com/contest/weekly-contest-58/problems/find-pivot-index/

# Given an array of integers nums, write a method that returns the "pivot" index of this array.

# We define the pivot index as the index where the sum of the numbers to the left of the index is equal to the sum of the numbers to the right of the index.

# If no such index exists, we should return -1. If there are multiple pivot indexes, you should return the left-most pivot index.

# Input: 
# nums = [1, 7, 3, 6, 5, 6]
# Output: 3
# Explanation: 
# The sum of the numbers to the left of index 3 (nums[3] = 6) is equal to the sum of numbers to the right of index 3.
# Also, 3 is the first index where this occurs.

# Example 2:
# Input: 
# nums = [1, 2, 3]
# Output: -1
# Explanation: 
# There is no index that satisfies the conditions in the problem statement.

# Note:

# - The length of nums will be in the range [0, 10000].
# - Each element nums[i] will be an integer in the range [-1000, 1000].

# @param {Integer[]} nums
# @return {Integer}
def pivot_index(nums)
  return -1 if nums.empty?
  half_index = nums.length / 2
  # puts half_index

  result = pivot_index?(nums, half_index)
  if result == 0
    return half_index
  elsif result == -1
    while half_index != -1 do
      half_index -= 1
      result = pivot_index?(nums, half_index)
      if result == 0
        return half_index
      elsif result == 1
        return -1
      end
    end
  else
    while half_index != nums.length do
      half_index += 1
      result = pivot_index?(nums, half_index)
      if result == 0
        return half_index
      elsif result == -1
        return -1
      end
    end
  end
  return -1
end

def pivot_index?(nums, index)
  left = nums[0..index]
  right = nums[index..nums.length-1]
  puts "left: #{left}, right: #{right}"
  if left.sum == right.sum
    0
  elsif left.sum > right.sum
    -1
  else
    1
  end
end

[
  # [1, 7, 3, 6, 5, 6], [1, 2, 3], [1, 2, 4, 1, 1, 1], [1, 2, 3, 6],
  # [1,1,1,1,3], [], [-1,-1,-1,-1,-1,-1],
  [-1, -1, -1, -1, -1, 0]
].each do |nums|
  puts pivot_index(nums)
end
