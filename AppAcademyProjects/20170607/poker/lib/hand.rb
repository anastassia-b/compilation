require_relative 'deck'
require_relative 'card'

FACE_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K, :A]

class Hand
  attr_reader :deck, :cards
  def initialize(deck, cards = [])
    @deck = deck
    @cards = cards
    #build_hand
  end

  def build_hand
    5.times do
      @cards << deck.deal_card
    end
  end

  def length
    @cards.length
  end

  def straight_flush?
    return false unless @cards.all? { |card| card.suit == @cards[0].suit }
    values = []
    @cards.each { |card| values << card.value }
      hand_values = sort_hand(values)

      (0...hand_values.length - 1).each do |i|
        j = i + 1
        j_idx = (FACE_VALUES.index(hand_values[i]) + 1)
        return false unless hand_values[j] == FACE_VALUES[j_idx]
      end
    true
  end

  def four_of_a_kind?
    values = []
    @cards.each { |card| values << card.value }
     values.any?{ |value| values.count(value) == 4 }
  end

  def full_house?
    values = []
    @cards.each { |card| values << card.value }
     values.any?{ |value| values.count(value) == 3 } &&
     values.any?{ |value| values.count(value) == 2 }
  end

  def flush?
    return false unless @cards.all? { |card| card.suit == @cards[0].suit }
    true
  end

  def straight?
    values = []
    @cards.each { |card| values << card.value }
      hand_values = sort_hand(values)

      (0...hand_values.length - 1).each do |i|
        j = i + 1
        j_idx = (FACE_VALUES.index(hand_values[i]) + 1)
        return false unless hand_values[j] == FACE_VALUES[j_idx]
      end
    true
  end


  private
  def sort_hand(arr)
    sorted = false
    until sorted
      sorted = true

      arr.length.times do |i|
        break if i == arr.length - 1
        if FACE_VALUES.index(arr[i]) > FACE_VALUES.index(arr[i+1])
          arr[i], arr[i+1] = arr[i+1], arr[i]
          sorted = false
        end
      end
    end
    arr
  end

end


hand = Hand.new(Deck.new)
 p hand.straight_flush?
