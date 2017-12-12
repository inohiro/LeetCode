# 292. Nim game
# https://leetcode.com/problems/nim-game/

# You are playing the following Nim Game with your friend: There is a heap of stones on the table, each time one of you take turns to remove 1 to 3 stones. The one who removes the last stone will be the winner. You will take the first turn to remove the stones.

# Both of you are very clever and have optimal strategies for the game. Write a function to determine whether you can win the game given the number of stones in the heap.

# For example, if there are 4 stones in the heap, then you will never win the game: no matter 1, 2, or 3 stones you remove, the last stone will always be removed by your friend.

require 'pp'

# @param {Integer} n
# @return {Boolean}
@map = nil
def can_win_nim(n)
  @map = {}
  @map[1] = true
  @map[2] = true
  @map[3] = true
  @map[4] = false
  dp(n)
  @map[n]
end

def dp(n)
  if @map[n]
    @map[n]
  else
    if dp(n-1) || dp(n-2) || dp(n-3)
      @map[n] = true
    else
      @map[n] = false
    end
  end
end

n = 8 #=> true
puts can_win_nim(n)
