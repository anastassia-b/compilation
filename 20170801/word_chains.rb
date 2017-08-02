require 'set'

class WordChainer
 attr_reader :dictionary

 def initialize(dictionary_file_name)
   @dictionary = File.readlines(dictionary_file_name).map(&:chomp)
   @dictionary = Set.new(@dictionary)
  end

  def run(source, target)
    @current_words, @all_seen_words = [source], { source => nil }

    until @current_words.empty? || @all_seen_words.include?(target)
      explore_current_words
    end

    build_path(target)
  end

  def adjacent_words(word)
    adj_words = []
    word.each_char.with_index do |old_letter, i|
      ('a'..'z').each do |new_letter|
        next if old_letter == new_letter

        new_word = word.dup
        new_word[i] = new_letter

        adj_words << new_word if dictionary.include?(new_word)
      end
    end

    adj_words
  end

  def explore_current_words
    new_current_words = []
    @current_words.each do |current_word|
      adjacent_words(current_word).each do |adjacent_word|
        next if @all_seen_words.has_key?(adjacent_word)

        new_current_words << adjacent_word
        @all_seen_words[adjacent_word] = current_word
      end
    end

    @current_words = new_current_words
  end

  def build_path(target)
    path = []
    current_word = target
    until current_word.nil?
      path << current_word
      current_word = @all_seen_words[current_word]
    end

    path.reverse
  end
end


if __FILE__ == $PROGRAM_NAME
  p WordChainer.new(ARGV.shift).run("duck", "ruby")
end
