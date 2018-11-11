# https://leetcode.com/problems/roman-to-integer/

# @param {String} s
# @return {Integer}
def roman_to_int(s)
  dict = {'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000 }
  _dict = { 'IV' => 4, 'IX' => 9, 'XL' => 40, 'XC' => 90, 'CD' => 400, 'CM' => 900 }

  result = 0
  i = 0

  while i < s.length
    if %w[I X C].include?(s[i]) && r = _dict[s[i..i+1]]
      result += r
      i += 1
    else
      result += dict[s[i]]
    end
    i += 1
  end
  result
end

s = 'LXLM' #=> invalid
puts roman_to_int(s)

%w[III IV IX LVIII MCMXCIV].each do |s|
  puts roman_to_int(s)
end
