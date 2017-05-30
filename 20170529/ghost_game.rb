#Anastassia Bobokalonova
#May 29, 2017

class Game
  attr_reader :player1, :player2, :dictionary, :current_player, :previous_player
  attr_accessor :fragment, :over

  def initialize(*players)
    @fragment = ""
    @players
    @over = false
    words = File.readlines("dictionary.txt").map(&:chomp)
    @dictionary = Set.new(words)
    end

  end

  def current_player
    @players.first
  end

  def previous_player
    @players.last
  end

  def next_player!
    @players.rotate!
  end

  def play_game
    play_round until @over
    puts "The game is over, and #{previous_player} is the Winner!"
  end

  def play_round
    take_turn(current_player)
    next_player!
  end

  def take_turn(player)
    letter = player.guess
    if valid_play?(@fragment + letter)
      @fragment += letter
      puts "Great job! The word so far is #{@fragment}"
    else
      @over = true
      puts "Sorry, that is an invalid play! You lose, #{current_player}!"
    end
  end

  def valid_play?(string)
    @dictionary.each do |word|
      return false if string == word
      return true if substring?(string, word)
    end
    false
  end

  def substring?(string, word)
    word.include?(string)
  end

end

class Player

  def initialize(name)
    @name = name
  end

  def guess
    puts "#{@name}, please enter a letter:"
    input = gets.chomp.downcase
    if valid_guess?(input)
      return input
    else
      alert_invalid_guess
      guess
    end
  end

  def valid_guess?(input)
    ("a".."z").include?(input)
  end

  def alert_invalid_guess
    puts "That's not a valid guess, #{@name}."
  end

  def to_s
    @name
  end

end

new_game = Game.new(Player.new("Anastassia"), Player.new("Syrie"))
new_game.play_game
