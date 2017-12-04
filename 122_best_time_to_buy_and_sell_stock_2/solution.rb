# 122. Best Time to Buy and Sell Stock II
# https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  profit = 0

  (1..prices.length-1).each do |i|
    if prices[i] > prices[i-1]
      profit += prices[i] - prices[i-1]
    end
  end

  profit
end

# prices = [2,1,2,1,0,1,2] #=> 3
# prices = [2,1,2,0,1] #=> 2
# prices = [7,6,5,4,3,2,1] #=> 0
# prices = [1,2,3,4,5,6,7] #=> 6
prices = [7,1,5,3,6,4] #=> 7
# prices = [7,6,4,3,1] #=> 0
# prices = [] #=> 0
# prices = [2,4,1] #=> 2
puts max_profit(prices)
