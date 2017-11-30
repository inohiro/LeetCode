# 121. Best Time to Buy and Sell Stock
# https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

# Say you have an array for which the ith element is the price of a given stock on day i.
# If you were only permitted to complete at most one transaction (ie, buy one and sell one share of the stock), design an algorithm to find the maximum profit.

# Example 1:
# Input: [7, 1, 5, 3, 6, 4]
# Output: 5

# max. difference = 6-1 = 5 (not 7-1 = 6, as selling price needs to be larger than buying price)

# Example 2:
# Input: [7, 6, 4, 3, 1]
# Output: 0

# In this case, no transaction is done, i.e. max profit = 0.

require 'pp'

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  return 0 if prices.length < 2
  
  i = 0
  j = 0
  min = 1000000
  max = 0
  max_profit = 0

  (0..prices.length-1).each do |i|
    if prices[i] < min
      min = prices[i]
      max = 0
      puts "min update: i: #{i}, j: #{j}, prices[i]: #{prices[i]}, prices[j]: #{prices[j]}, min: #{min}, max: #{max}"
    end
    if prices[j] > max 
      max = prices[j]
      puts "MAX update: i: #{i}, j: #{j}, prices[i]: #{prices[i]}, prices[j]: #{prices[j]}, min: #{min}, MAX: #{max}"
    end
    max_profit = max - min if max_profit < max - min
    i += 1
    j += 1
  end

  max_profit
end

prices = [2,1,2,1,0,1,2] #=> 2
# prices = [2,1,2,0,1] #=> 1
# prices = [7,6,5,4,3,2,1]
# prices = [1,2,3,4,5,6,7]
# prices = [7,1,5,3,6,4]
# prices = [7,6,4,3,1]
# prices = []
# prices = [2,4,1]
puts max_profit(prices)
