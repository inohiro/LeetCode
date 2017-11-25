# 16. Remove duplicates from sorted array
# https://leetcode.com/problems/remove-duplicates-from-sorted-array/

require 'pp'
def remove_duplicates(nums)
  l = nums.length
  return 0 if l < 1

  i = 0
  (1..l-1).each do |j|
    if nums[i] != nums[j]
      i += 1
      nums[i] = nums[j]
    end
  end
  i + 1
end

# nums = [1,1,1,1,1,1,1,2];
# nums = [1,1,2]
nums = [1,2,3,4,4,5,6,7,7,7,8]
puts remove_duplicates(nums)
