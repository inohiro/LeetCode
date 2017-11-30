# 121. Best Time to Buy and Sell Stock
# An implementation of solution

require 'pp'

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  max_profit = 0
  min = 10000000

  (0..prices.length-1).each do |i|
    if prices[i] < min
      min = prices[i]
    elsif prices[i] - min > max_profit
      max_profit = prices[i] - min
    end
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
