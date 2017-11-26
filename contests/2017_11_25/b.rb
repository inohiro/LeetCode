# 734. Sentence Similarity

require 'pp'

# Given two sentences words1, words2 (each represented as an array of strings), and a list of similar word pairs pairs, determine if two sentences are similar.

# For example, "great acting skills" and "fine drama talent" are similar, if the similar word pairs are pairs = [["great", "fine"], ["acting","drama"], ["skills","talent"]].

# Note that the similarity relation is not transitive. For example, if "great" and "fine" are similar, and "fine" and "good" are similar, "great" and "good" are not necessarily similar.

# Also, a word is always similar with itself. For example, the sentences words1 = ["great"], words2 = ["great"], pairs = [] are similar, even though there are no specified similar word pairs.

# Note:

# The length of words1 and words2 will not exceed 1000.
# The length of pairs will not exceed 2000.
# The length of each pairs[i] will be 2.
# The length of each words[i] and pairs[i][j] will be in the range [1, 20].

# @param {String[]} words1
# @param {String[]} words2
# @param {string[][]} pairs
# @return {Boolean}
def are_sentences_similar(words1, words2, pairs)
  return true if words1.empty? && words2.empty?
  return false if words1.empty? || words2.empty?
  return false if words1.length != words2.length
  if pairs.empty?
    if words1 == words2 
      return true
    else
      return false
    end      
  end

  dict = Hash.new {|h,k| h[k] = [] }
  pairs.each do |pair|
    dict[pair[0]] << pair[1]
    dict[pair[1]] << pair[0]
  end

  words1.each do |word|
    dict[word] << word unless dict[word].include?(word)
  end

  words2.each do |word|
    dict[word] << word unless dict[word].include?(word)
  end
  # pp dict

  result = false

  replaced_words1 = replace_with_dict(words1, dict)
  # pp words2
  # pp replaced_words1
  result = check_inclusion(replaced_words1, words2)
    
  replaced_words2 = replace_with_dict(words2, dict)
  # pp words1
  # pp replaced_words2
  result = check_inclusion(replaced_words2, words1)
  return result
end

def check_inclusion(replaced, words)
  result = false
  words.each_with_index do |word,i|
    if replaced[i] && replaced[i].include?(word)
      result = true
    else
      return false
    end
  end
  result
end

def replace_with_dict(words, dict)
  new_word_cands = []
  words.each do |word|
    new_word_cands << dict[word] if dict[word]
  end
  new_word_cands
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
