require 'card'
require 'deck'
require 'hand'

describe '#hand' do
  # let(:deck) { double('deck')}
  subject(:deck) { Deck.new }
  subject(:hand) { Hand.new(deck) }

  describe '#initialize' do
    it 'starts with an array of cards' do
      expect(hand.cards).to be_an(Array)
    end
  end

  describe '#assign_rank' do

  end
  #let(:hand) {double('hand'), @cards => []}

  describe '#straight_flush?' do
    card1 = Card.new(:club, 2)
    card2 = Card.new(:club, 3)
    card3 = Card.new(:club, 4)
    card4 = Card.new(:club, 5)
    card5 = Card.new(:club, 6)
    subject(:hand) { Hand.new(deck, [card1, card2, card3, card4, card5]) }

    it 'checks if hand is straight_flush' do
      expect(hand.straight_flush?).to eq true
    end
  end

  describe '#four_of_a_kind?' do
    card1 = Card.new(:club, 2)
    card2 = Card.new(:spade, 2)
    card3 = Card.new(:diamond, 2)
    card4 = Card.new(:heart, 2)
    card5 = Card.new(:club, 6)
    subject(:hand) { Hand.new(deck, [card1, card2, card3, card4, card5]) }

    it 'checks with hand is four of a kind' do
      expect(hand.four_of_a_kind?).to eq true
    end

  end

  describe '#full_house?' do
    card1 = Card.new(:club, 2)
    card2 = Card.new(:spade, 2)
    card3 = Card.new(:diamond, 2)
    card4 = Card.new(:heart, 6)
    card5 = Card.new(:club, 6)
    subject(:hand) { Hand.new(deck, [card1, card2, card3, card4, card5]) }

    it 'checks with hand is a full house' do
      expect(hand.full_house?).to eq true
    end
  end


  describe '#flush?' do
    card1 = Card.new(:club, 2)
    card2 = Card.new(:club, :A)
    card3 = Card.new(:club, :K)
    card4 = Card.new(:club, 7)
    card5 = Card.new(:club, 6)
    subject(:hand) { Hand.new(deck, [card1, card2, card3, card4, card5]) }

    it 'checks with hand is a flush' do
      expect(hand.flush?).to eq true
    end
  end

  describe '#straight?' do
    card1 = Card.new(:club, 2)
    card2 = Card.new(:heart, 3)
    card3 = Card.new(:spade, 4)
    card4 = Card.new(:club, 5)
    card5 = Card.new(:club, 6)
    subject(:hand) { Hand.new(deck, [card1, card2, card3, card4, card5]) }

    it 'checks with hand is a straight' do
      expect(hand.straight?).to eq true
    end
  end

  describe '#three_of_a_kind?'

  describe '#two_pair?'

  describe '#one_pair?'

  describe '#high_card?'
end
