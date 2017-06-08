require_relative 'card'

SUITS = [:heart, :club, :spade, :diamond]
VALUE = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]

class Deck
  attr_reader :cards
  def initialize
    @cards = []
    build_cards
    shuffle!
  end

  def build_cards
    SUITS.each do |suit|
      VALUE.each do |value|
        @cards << Card.new(suit, value)
      end
    end
  end

  def shuffle!
    @cards.shuffle!
  end

  def deal_card
    @cards.pop
  end

  def length
    @cards.length
  end

end
