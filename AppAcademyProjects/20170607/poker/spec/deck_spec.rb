require 'deck'
require 'card'

describe '#deck' do

  subject(:deck) { Deck.new }
  subject(:deck2) { Deck.new }

  describe '#initialize' do
    it 'is an array of 52 cards' do
      expect(deck.length).to eq(52)
    end

    it 'has card objects' do
      expect(deck.cards).to include(Card)
    end

    it 'has four queens' do
      queens = 0
      deck.cards.each do |card|
        queens += 1 if card.value == :Q
      end
      expect(queens).to eq(4)
    end

  end

  describe '#shuffle!' do

    it 'randomly changes order of cards' do
      deck.shuffle!
      expect(deck.cards).not_to eq(deck2.cards)
    end
  end

  describe '#deal_card' do

    # it 'takes top card' do
    #   card = deck.deal_card
    #   expect(card.value).to eq(:A)
    #   expect(card.suit).to eq(:diamond)
    # end

    it 'removes 1 card from deck' do
     deck.deal_card
     expect(deck.length).to eq(51)
    end
  end


end
