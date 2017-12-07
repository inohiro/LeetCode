# 167. Two Sum II - Input array is sorted
# https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

# Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.

# The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2. Please note that your returned answers (both index1 and index2) are not zero-based.

# You may assume that each input would have exactly one solution and you may not use the same element twice.

# Input: numbers={2, 7, 11, 15}, target=9
# Output: index1=1, index2=2

require 'pp'

# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  return [] if numbers.empty?
  l = numbers.length
  i = 0
  j = 0

  while i < l do
    j = target - numbers[i]
    result = bs(numbers[i+1..numbers.length-1], j)
    break if result
    i += 1
  end

  index2 = 0
  numbers.each_with_index do |k, idx|
    if k == j
      if i == idx
        next
      else
        index2 = idx
        break
      end
    end
  end

  [i+1,index2+1]
end

def bs(numbers, target)
  return false if numbers.empty?
  l = numbers.length
  if (l == 1 || l == 2)
    return numbers.include?(target) ? true : false
  end

  middle = l/2

  puts "------------------------------"
  pp numbers
  pp target
  pp middle
  
  if numbers[middle] >= target
    bs(numbers[0..middle], target)
  else
    bs(numbers[middle+1..l-1], target)
  end
end

# numbers = [2,7,11,15]
# target = 9

# numbers = [1,2,3,4,5,6]
# target = 8

# numbers = [2,3,4]
# target = 6

numbers = [3,24,50,79,88,150,345]
target = 200

# numbers = [0,0,3,4]
# target = 0

pp two_sum(numbers, target)

