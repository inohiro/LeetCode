# https://leetcode.com/problems/maximum-subarray/

# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  return 0 if nums.empty?

  max_sum = nums.first
  i = 0
  j = 0
  while i < nums.length
    puts '------------------------------------'
    puts "i: #{i}"
    puts "nums[i]: #{nums[i]}"
    puts "max_sum: #{max_sum}"    
    j = i + 1

    while max_sum < nums[i..j].sum
      puts '----------------'
      puts "j: #{j}"
      puts "max_sum: #{max_sum}"
      puts "nums[i..j].sum: #{nums[i..j].sum}"
      max_sum = nums[i..j].sum
      j += 1
    end

    max_sum = nums[i] if nums[i] > max_sum
    i += 1
  end
  max_sum
end

# nums = [-2,1,-3,4,-1,2,1,-5,4] #=> 6
# nums = [-2,1,1] #=> 2
# nums = [-2,1] #=> 1
# nums = [-3,-2,-1] #=> -1
# nums = [1,1,1] #=> 3
# nums = [-1,-1,-1] #=> -1
# nums = [1,-1,-3] #=> 1
# nums = [-1,0,-2] #=> 0
nums = [8,-19,5,-4,20] #=> 21
pp max_sub_array(nums)
