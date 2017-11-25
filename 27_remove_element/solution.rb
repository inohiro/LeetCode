# 27. Remove element
# https://leetcode.com/problems/remove-element/description/
def remove_element(nums, val)
  l = nums.length
  return 0 if l < 1

  i = 0
  (0..l-1).each do |j|
    if nums[j] != val
      nums[i] = nums[j]
      i += 1
    end
  end
  
  i
end

nums = [3,2,2,3]
puts remove_element(nums, 3)
