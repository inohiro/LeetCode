# 292. Nim game
# https://leetcode.com/problems/nim-game/

# @param {Integer} n
# @return {Boolean}
@map = nil
def can_win_nim(n)
  n % 4 != 0
end

n = 50 #=> true
puts can_win_nim(n)
