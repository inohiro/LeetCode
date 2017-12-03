# 739. Daily Temperatures
# https://leetcode.com/contest/weekly-contest-61/problems/daily-temperatures/
# https://discuss.leetcode.com/topic/112830/java-easy-ac-solution-with-stack

require 'pp'

def daily_temperatures(temperatures)
  l = temperatures.length
  result = Array.new(l,0)
  stack = []
  (0..l-1).each do |i|
    # puts "-------------------------------"
    # pp stack
    # pp result
    while !stack.empty? && temperatures[i] > temperatures[stack.last]
      idx = stack.pop
      result[idx] = i - idx
    end
    stack.push(i)
  end
  
  result
end

temps = %w(73 74 75 71 69 72 76 73).map(&:to_i)
# temps = %w(80 79 78 77 76 75 74 73 72 71).map(&:to_i)
# temps = (0..30000).map(&:to_i).reverse
pp daily_temperatures(temps)
