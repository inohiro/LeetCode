# An implementation of https://discuss.leetcode.com/topic/112030/short-python-solution-based-on-dictionary

def are_sentences_similar(words1, words2, pairs)
  return false if words1.length != words2.length
  dict = Hash.new {|h,k| h[k] = []}

  pairs.each do |pair|
    dict[pair[0]] << pair[1]
  end

  (0..words1.length-1).each do |i|
    if words1[i] == words2[i] || dict[words2[i]].include?(words1[i]) || dict[words1[i]].include?(words2[i])
      next
    else
      return false
    end
  end
  return true
end

[
  [words1 = ["great","acting","skills"],
   words2 = ["fine","drama","talent"],
   pairs = [["great","fine"],["drama","acting"],["skills","talent"]] #=> true
],

  [words1 = %w(great),
   words2 = %w(great),
   pairs = []
],

  [words1= ["an","extraordinary","meal"],
   words2= ["one","good","dinner","dinner"],
   pairs= [["great","good"],["extraordinary","good"],["well","good"],["wonderful","good"],["excellent","good"],["fine","good"],["nice","good"],["any","one"],["some","one"],["unique","one"],["the","one"],["an","one"],["single","one"],["a","one"],["truck","car"],["wagon","car"],["automobile","car"],["auto","car"],["vehicle","car"],["entertain","have"],["drink","have"],["eat","have"],["take","have"],["fruits","meal"],["brunch","meal"],["breakfast","meal"],["food","meal"],["dinner","meal"],["super","meal"],["lunch","meal"],["possess","own"],["keep","own"],["have","own"],["extremely","very"],["actually","very"],["really","very"],["super","very"]]
],

  [words1= ["great","acting","skills"],
   words2= ["fine","painting","talent"],
   pairs= [["great","fine"],["drama","acting"],["skills","talent"]]
],

  [words1= ["an","extraordinary","meal"],
   words2= ["one","good","dinner","dinner"],
   pairs = [["great","good"],["extraordinary","good"],["well","good"],["wonderful","good"],["excellent","good"],["fine","good"],["nice","good"],["any","one"],["some","one"],["unique","one"],["the","one"],["an","one"],["single","one"],["a","one"],["truck","car"],["wagon","car"],["automobile","car"],["auto","car"],["vehicle","car"],["entertain","have"],["drink","have"],["eat","have"],["take","have"],["fruits","meal"],["brunch","meal"],["breakfast","meal"],["food","meal"],["dinner","meal"],["super","meal"],["lunch","meal"],["possess","own"],["keep","own"],["have","own"],["extremely","very"],["actually","very"],["really","very"],["super","very"]]
],

  [words1 = ["one","excellent","meal"],
   words2= ["one","good","dinner"], 
   pairs = [["great","good"],["extraordinary","good"],["well","good"],["wonderful","good"],["excellent","good"],["fine","good"],["nice","good"],["any","one"],["some","one"],["unique","one"],["the","one"],["an","one"],["single","one"],["a","one"],["truck","car"],["wagon","car"],["automobile","car"],["auto","car"],["vehicle","car"],["entertain","have"],["drink","have"],["eat","have"],["take","have"],["fruits","meal"],["brunch","meal"],["breakfast","meal"],["food","meal"],["dinner","meal"],["super","meal"],["lunch","meal"],["possess","own"],["keep","own"],["have","own"],["extremely","very"],["actually","very"],["really","very"],["super","very"]]
],

  [words1 = ["an","extraordinary","meal"],
   words2 = ["one","good","dinner"],
   pairs = [["great","good"],["extraordinary","good"],["well","good"],["wonderful","good"],["excellent","good"],["fine","good"],["nice","good"],["any","one"],["some","one"],["unique","one"],["the","one"],["an","one"],["single","one"],["a","one"],["truck","car"],["wagon","car"],["automobile","car"],["auto","car"],["vehicle","car"],["entertain","have"],["drink","have"],["eat","have"],["take","have"],["fruits","meal"],["brunch","meal"],["breakfast","meal"],["food","meal"],["dinner","meal"],["super","meal"],["lunch","meal"],["possess","own"],["keep","own"],["have","own"],["extremely","very"],["actually","very"],["really","very"],["super","very"]]
]].each do |w1,w2,p|
  puts are_sentences_similar(w1,w2,p)
end
