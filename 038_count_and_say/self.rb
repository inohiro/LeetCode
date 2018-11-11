# https://leetcode.com/problems/count-and-say/

# 1: 1
# 2: 11
# 3: 21
# 4: 1211
# 5: 111221
# 6: 312211
# 7: 13112221
# 8: 1113213211

# https://en.wikipedia.org/wiki/Look-and-say_sequence
# http://blog.panicblanket.com/archives/3316

# @param {Integer} n
# @return {String}
def count_and_say(n)
  i = 0
  result = '1'
  while i < n-1
    result = mite_itte(result)
    i += 1
  end
  result
end

def mite_itte(seq)
  i = 0
  result = []
  while i < seq.chars.length
    counter = 0
    current = seq[i]
    while seq[i] == current
      counter += 1
      i += 1
    end
    result << "#{counter}#{current}"
  end

  result.join
end

(1..8).each do |i|
  puts count_and_say(i)
end
puts count_and_say(1) #=> "1"
puts count_and_say(4) #=> "1211"
puts count_and_say(8)
puts count_and_say(20)
