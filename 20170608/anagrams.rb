

def first_anagram?(word1, word2)
  anagrams = get_anagrams(word1)
  anagrams.include?(word2)
end

def get_anagrams(word)
  return [""] if word.length == 0

  first_letter = word[0]
  anagrams = get_anagrams(word[1..-1])
  total_anagrams = []

  anagrams.each do |anagram|
    (0..anagram.length).each do |i|
      total_anagrams << anagram[0...i] + first_letter + anagram[i..-1]
    end
  end
  total_anagrams.sort
end


p get_anagrams("word")
p first_anagram?("word", "door")
p first_anagram?("word", "dowr")

def second_anagram?(word1, word2)
  word1_arr = word1.split("")
  word2_arr = word2.split("")

  word1_arr.each_with_index do |ch, i|
    if word2_arr.include?(ch)
      word1_arr[i] = ""
      word2_arr[word2.index(ch)] = ""
    end
  end
  # p word1_arr
  # p word2_arr
  word1_arr == word2_arr
end

p second_anagram?("word", "dowr")
p second_anagram?("word", "door")

def third_anagram?(word1, word2)
  word1.chars.sort == word2.chars.sort
end
p third_anagram?("word", "dowr")
p third_anagram?("word", "door")

def fourth_anagram?(word1, word2)
 hash = Hash.new {|h,k| h[k] = 0}
 word1.chars.each do |ch|
   hash[ch] += 1
 end
 word2.chars.each do |ch|
  hash[ch] -= 1
 end
  hash.values.all? {|i| i == 0}
end

p fourth_anagram?("word", "dowr")
p fourth_anagram?("word", "door")
