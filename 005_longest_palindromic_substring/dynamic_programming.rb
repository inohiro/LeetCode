require 'benchmark'

def fib_bottomup(n)
  memo = {0 => 1, 1 => 1}
  i = 2
  while i <= n do
    memo[i] = memo[i-1] + memo[i-2]
    i += 1
  end
  memo[n]
end

@memo = Hash.new

def fib_topdown(n)
  if n <= 1
    @memo[n] = 1
  elsif @memo[n]
    @memo[n]
  else
    result = fib_topdown(n-1) + fib_topdown(n-2)
    @memo[n] = result
  end
end

def fib(n)
  if n <= 1
    1
  else
    fib(n-1) + fib(n-2)
  end
end

# %w(10 100 1_000 10_000 100_000).map(&:to_i).each do |i|
%w(10 20 30 40).map(&:to_i).each do |i|
  puts fib_bottomup(i)
  puts fib_topdown(i)
  puts fib(i)
  # Benchmark.bm(10) do |b|
  #   b.report "bottom up" do
  #     fib_bottomup(i)
  #   end
  #   @memo.clear
  #   b.report "topdown" do
  #     fib_topdown(i)
  #   end
  # end
end

