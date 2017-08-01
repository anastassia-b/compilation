require 'set'

class WordChainer
 attr_reader :dictionary

 def initialize(dictionary_file_name)
   @dictionary = File.readlines(dictionary_file_name).map(&:chomp)
   @dictionary = Set.new(@dictionary)
  end

end


if __FILE__ == $PROGRAM_NAME
  # p WordChainer.new(ARGV.shift).run("duck", "ruby")
  p WordChainer.new(ARGV.shift)
end
