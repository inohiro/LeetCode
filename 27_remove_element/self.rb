# 27. Remove element
# https://leetcode.com/problems/remove-element/description/

def remove_element(nums, val)
  nums.delete(val)
  nums.length
end

nums = [3,2,2,3]
puts remove_element(nums, 3)
