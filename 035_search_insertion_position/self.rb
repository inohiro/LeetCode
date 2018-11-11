# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  # puts "==========================================="
  return 0 if nums.length == 0
  return 0 if nums.min > target
  return nums.length  if nums.max < target
  binary_search(nums, target, 0)
end

# require 'pp'

def binary_search(ary, target, base)
  half_i = ary.length / 2     
  return base + half_i if ary[half_i] == target

  # puts "--------------------------------------------"
  # pp "ary: #{ary}"
  # pp "length: #{ary.length}"
  # pp "target: #{target}"
  # pp "half_i: #{half_i}"
  # pp "base: #{base}"

  if ary.length < 3
    if ary.first < target
      return base + 1
    elsif ary.last < target
      return base + ary.length + 1
    else
      return base # ?
    end
  end

  if ary[half_i] > target
    binary_search(ary[0..half_i], target, base)
  else
    binary_search(ary[half_i+1..ary.length-1], target, base + half_i+1)
  end    
end

[
  [[1,3,5], 5],
#  [[1,3,5,6], 5], #=> 2
#  [[1,3,5,6], 2], #=> 1
#  [[1,3,5,6], 7], #=> 4
#  [[1,3,5,6], 0], #=> 0
#  [[1,2,3,5,6,7,8], 4], #=> 3
#  [[0], 3], #=> 1
#  [[1], 0], #=> 0
#  [[1], 1], #=> 0
#  [[1,2,3,4,5,6], 5], #=> 4
  # [
  #   begin
  #     ary = (1..100).to_a
  #     ary.delete_at(21)
  #     ary
  #   end, 22
  # ],
  # [(1..100).to_a, 22], #=> 21
].each do |nums, target|
  puts search_insert(nums, target)
end
