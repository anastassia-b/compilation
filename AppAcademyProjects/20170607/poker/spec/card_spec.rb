require 'card.rb'


describe '#initialize' do
  subject(:card) { Card.new(:heart, 10) }

  it "initializes with a suit" do
    expect(card.suit).to eq(:heart)
  end

  it 'initializes with a value' do
    expect(card.value).to eq(10)
  end
end
