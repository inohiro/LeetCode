def climb_stairs(n)
  return 1 if n == 1

  dp = []
  dp[1] = 1
  dp[2] = 2

  i = 3
  while i <= n do
    dp[i] = dp[i-1] + dp[i-2]
    i += 1
  end

  dp.last
end

n = 6
puts climb_stairs(n)
