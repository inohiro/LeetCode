# 739. Daily Temperatures
# https://leetcode.com/contest/weekly-contest-61/problems/daily-temperatures/

# Given a list of daily temperatures, produce a list that, for each day in the input, tells you how many days you would have to wait until a warmer temperature. If there is no future day for which this is possible, put 0 instead.

# For example, given the list temperatures = [73, 74, 75, 71, 69, 72, 76, 73], your output should be [1, 1, 4, 2, 1, 1, 0, 0].

# Note: The length of temperatures will be in the range [1, 30000]. Each temperature will be an integer in the range [30, 100].

require 'pp'

# @param {Integer[]} temperatures
# @return {Integer[]}
def daily_temperatures(temperatures)
  l = temperatures.length
  result = Array.new(l,0)
  (0..l-1).each do |i|
    (i+1..l-1).each do |j|      
      if temperatures[i] < temperatures[j]
        result << j - i
        break
      elsif j == l-1
        result << 0
        break
      end
      j += 1
    end
    i += 1
  end
  result
end

temps = %w(73 74 75 71 69 72 76 73).map(&:to_i)
# temps = %w(80 79 78 77 76 75 74 73 72 71).map(&:to_i)
# temps = (0..30000).map(&:to_i).reverse
pp daily_temperatures(temps)
