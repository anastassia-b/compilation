require 'hanoi'

describe '#towers_of_honoi' do

  subject(:game) { TowersOfHanoi.new }

  describe '#initialize' do
    it 'begins with 3 disks in tower 1' do
      expect(game.tower).to eq([[3, 2, 1],[],[]])
    end
  end

  describe '#move' do
    it 'recieves a position array' do
      expect{ game.move('0','2') }.to raise_error TypeError
    end

    it 'moves the disk from tower to tower' do
      game.move(0, 2)
      expect(game.tower).to eq([[3, 2],[],[1]])
    end
  end

  describe '#won?' do
    it 'returns a boolean' do
      expect(game.won?).to eq false
    end

    # let(:tower) { [[],[],[1,2,3]] }
    it 'returns true if game over' do
      game.move(0, 1)
      game.move(0, 2)
      game.move(2, 1)
      game.move(0, 2)
      game.move(1, 0)
      game.move(0, 2)
      game.move(1, 2)
      expect(game).to be_won
    end
  end

  describe '#play' do
    before(:each) { game.move(0, 1) }

    it 'moves towers based on input' do
      expect(game.tower).to eq([[3, 2],[1],[]])
    end

    it 'checks if game is over after move' do
      expect(game.won?).to eq false
    end
  end
end
