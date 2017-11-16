require_relative "Board.rb"
require_relative "Tile.rb"

class Game
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def play
    until board.solved?
      board.render
      puts "Which place would you like to modify?"
      pos = gets.chomp.split(",").map(&:to_i)
      puts "What number would you like to put there?"
      guess = gets.chomp

      if valid_move?(pos)
        @board[pos] = guess
      else
        puts "Invalid move! Number already given."
      end

    end
  end

  def valid_move?(pos)
    !@board[pos].given
  end

end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
