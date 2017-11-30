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
  # buy = 0
  # sell = prices.length - 1

  prices = prices.uniq
  
  i = 0
  j = prices.length - 1
  max = 0

  while i < (prices.length-1) do
    j = prices.length - 1
    while i < j do
      profit = prices[j] - prices[i]
      max = profit if profit > max
      puts "i: #{i}, j: #{j}, buy: #{prices[i]}, sell: #{prices[j]}, profit: #{profit}"
      j -= 1
    end
    i += 1
  end
  max
end

# prices = [7,1,5,3,6,4]
# prices = [7,6,4,3,1]
prices = []
puts max_profit(prices)
