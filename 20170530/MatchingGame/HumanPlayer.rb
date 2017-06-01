class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def prompt
    puts "Make a guess"
    puts "please enter a position on the board:"
    gets.chomp.split(",").map(&:to_i)
  end

  def to_s
    @name
  end

end
