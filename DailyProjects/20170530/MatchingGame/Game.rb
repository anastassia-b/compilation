require_relative 'Board.rb'
require_relative 'HumanPlayer.rb'
require_relative 'Card.rb'

class Game
  attr_reader :board, :players

  def initialize(*players)
    @board = Board.new
    @players = players
  end

  def current_player
    @players.first
  end

  def next_player!
    @players.rotate!
  end

  def play
    @board.populate
    until @board.won?
      next_player!
      system("clear")
      puts "It's #{current_player}'s turn!"
      @board.render

      card1 = make_guess
      card2 = make_guess

      unless matching?(card1, card2)
        card1.hide
        card2.hide
      end
      sleep(2)
    end
  end

  def matching?(card1, card2)
    card1 == card2
  end

  def make_guess
    pos = current_player.prompt
    @board.reveal(pos)
    @board[pos]
  end

end

if __FILE__ == $PROGRAM_NAME
  puts "player name?"
  name1 = gets.chomp
  player1 = HumanPlayer.new(name1)
  puts "player name?"
  name2 = gets.chomp
  player2 = HumanPlayer.new(name2)
  game = Game.new(player1, player2)
  game.play
end
