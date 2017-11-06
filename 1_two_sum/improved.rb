def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |num, i|
    hash.store(num, i) unless hash[num]
    less = target - num
    if hash[less]
      return [i,hash[less]].sort
    end
  end
end

nums = [2,7,11,15]
target = 9
puts two_sum(nums, target)
