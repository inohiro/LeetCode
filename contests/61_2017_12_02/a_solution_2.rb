# 739. Daily Temperatures
# https://leetcode.com/contest/weekly-contest-61/problems/daily-temperatures/
# https://discuss.leetcode.com/topic/112831/simple-python-by-hashing-the-temperatures

require 'pp'

MAX = 10000
def daily_temperatures(temperatures)
  l = temperatures.length
  result = Array.new(l,0)
  temps = {}
  i = l - 1
  while i >= 0 do
    result[i] = MAX
    temp = temperatures[i]
    # pp temps
    temps.keys.each do |key|
      if temp < key
        result[i] = [result[i], temps[key] - i].min
      end        
    end
    temps[temperatures[i]] = i
    result[i] = 0 if result[i] == MAX
    i -= 1
  end
    
  result
end

temps = %w(73 74 75 71 69 72 76 73).map(&:to_i)
# temps = %w(80 79 78 77 76 75 74 73 72 71).map(&:to_i)
# temps = (0..30000).map(&:to_i).reverse
pp daily_temperatures(temps)
