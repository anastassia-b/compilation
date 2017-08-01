require 'set'

class WordChainer
 attr_reader :dictionary

 def initialize(dictionary_file_name)
   @dictionary = File.readlines(dictionary_file_name).map(&:chomp)
   @dictionary = Set.new(@dictionary)
  end

  def run(source, target)

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

  end

  def build_path(target)

  end
end


if __FILE__ == $PROGRAM_NAME
  # p WordChainer.new(ARGV.shift).run("duck", "ruby")
  p WordChainer.new(ARGV.shift)
end
