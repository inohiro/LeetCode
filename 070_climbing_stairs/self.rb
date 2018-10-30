# 70. Climbing Stairs
# https://leetcode.com/problems/climbing-stairs/

# You are climbing a stair case. It takes n steps to reach to the top.
# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
# Note: Given n will be a positive integer.n

# Example 1:

# Input: 2
# Output:  2
# Explanation:  There are two ways to climb to the top.

# 1. 1 step + 1 step
# 2. 2 steps

# Example 2:

# Input: 3
# Output:  3
# Explanation:  There are three ways to climb to the top.

# 1. 1 step + 1 step + 1 step
# 2. 1 step + 2 steps
# 3. 2 steps + 1 step

# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  return 0 if n == 0
  return 1 if n == 1
  sum = 1 # when all 1 step
  if n % 2 == 0
    sum += 1 # when all 2 step
  end

  i = 1

  while n - (2*i) >= 1 do
    a = n-(2*i) + i
    b = i
    c = comb(a,b)
    # puts "a: #{a}, b: #{b}, c: #{c}"
    sum += c
    i += 1
  end
  sum
end

def comb(n,m)
  bunbo = 1
  bunshi = perm(n,m)
  (1..m).each {|i| bunbo *= i}
  # puts "n: #{n}, m: #{m}, bunshi: #{bunshi}, bunbo: #{bunbo}"
  bunshi / bunbo
end

def perm(n,m)
  bunbo = 1
  bunshi = 1
  (1..n-m).each {|i| bunbo *= i }
  (1..n).each {|i| bunshi *= i }
  # puts "n: #{n}, m: #{m}, bunshi: #{bunshi}, bunbo: #{bunbo}"
  bunshi / bunbo
end

# n = 2 #=> 2
n = 4 #=> 3
# n = 10
puts climb_stairs(n)

# input: 4 #=> 5
#  1 + 1 + 1 + 1
#  1 + 1 + 2 # P(3,1)
#  1 + 2 + 1
#  2 + 1 + 1
#  2 + 2

# input: 5 #=> 8
#  1 + 1 + 1 + 1 + 1
#  1 + 1 + 1 + 2
#  1 + 1 + 2 + 1
#  1 + 2 + 1 + 1
#  2 + 1 + 1 + 1
#  1 + 2 + 2
#  2 + 1 + 2
#  2 + 2 + 1

# input: 6 #=> 13
#  1 + 1 + 1 + 1 + 1 + 1
#  1 + 1 + 1 + 1 + 2  # P(5,1)
#  1 + 1 + 1 + 2 + 1
#  1 + 1 + 2 + 1 + 1
#  1 + 2 + 1 + 1 + 1
#  2 + 1 + 1 + 1 + 1
#  1 + 1 + 2 + 2 # P(4,2)
#  1 + 2 + 1 + 2
#  1 + 2 + 2 + 1
#  2 + 1 + 2 + 1
#  2 + 1 + 1 + 2
#  2 + 2 + 1 + 1
#  1 + 2 + 2 # P(3,2)
#  2 + 1 + 2
#  2 + 2 + 1
#  ...
