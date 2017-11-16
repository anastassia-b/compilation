require_relative 'Card.rb'

class Board #make this sym
  CARD_NAMES = ["cat", "cat", "dog", "dog",
            "ant", "ant", "pig", "pig",
            "bee", "bee", "bug", "bug",
            "cow", "cow", "emu", "emu"]

  attr_reader :board

  def initialize
    @board = Array.new(4) { Array.new(4) }
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def populate
    cards = CARD_NAMES.shuffle
    @board.each_with_index do |row, i1|
      row.each_with_index do |card, i2|
        self[[i1, i2]] = Card.new(cards.pop)
      end
    end
  end

  def render
    puts "-" * 19
    @board.each do |row|
      print "| "
      row.each do |card|
        if card.visible
          print "#{card} "
        else
          print "    "
        end
      end
      print "| \n"
    end
    puts "-" * 19
  end

  def won?
    @board.flatten.all? { |card| card.visible }
  end


  def reveal(guessed_pos)
    self[guessed_pos].reveal
    render
    self[guessed_pos].face_value
  end

end
