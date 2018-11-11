# https://leetcode.com/problems/valid-parentheses/

# @param {String} s
# @return {Boolean}
def is_valid(s)
  return false unless s.length % 2 == 0

  map = {'(' => ')', '[' => ']', '{' => '}'}
  stack = []
  
  s.chars.each do |char|
    if map.keys.include?(char) # is open
      stack << char
    elsif map.values.include?(char) # is close
      unless map[stack.pop] == char
        return false
      end
    else
      return false # ?
    end
  end
  stack.empty? ? true : false
end

[ "()",     # true
  "()[]{}", # true
  "(]",     # false
  "([)]",   # false
  "{[]}",   # true
  "[[[[]]]]]", # false
  "[",
  "[[",
  "]]",
  "[]{{]]",
  ""
].each do |input|
  puts is_valid(input)
end
