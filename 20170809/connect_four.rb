require_relative 'board'
require_relative 'player'

class Game

  def initialize(board = Board.new)
    @board = board
  end

  def run
    @board.render
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.run
end
