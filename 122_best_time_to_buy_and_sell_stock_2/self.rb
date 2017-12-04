# 122. Best Time to Buy and Sell Stock II
# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/

# Say you have an array for which the ith element is the price of a given stock on day i.

# Design an algorithm to find the maximum profit. You may complete as many transactions as you like (ie, buy one and sell one share of the stock multiple times). However, you may not engage in multiple transactions at the same time (ie, you must sell the stock before you buy again).

MIN = 10000000
# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  profit = 0
  min = MIN

  (0..prices.length-1).each do |i|
    if prices[i] < min
      min = prices[i]
    elsif prices[i] > min
      profit += (prices[i] - min)
      min = MIN
    end
    if prices[i] < min
      min = prices[i]
    end
  end
  profit
end

# prices = [2,1,2,1,0,1,2] #=> 3
# prices = [2,1,2,0,1] #=> 2
# prices = [7,6,5,4,3,2,1] #=> 0
# prices = [1,2,3,4,5,6,7] #=> 6
# prices = [7,1,5,3,6,4] #=> 7
# prices = [7,6,4,3,1] #=> 0
# prices = [] #=> 0
prices = [2,4,1] #=> 2
puts max_profit(prices)
