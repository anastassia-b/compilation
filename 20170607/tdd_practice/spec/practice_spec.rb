require 'rspec'
require 'practice'

describe '#my_uniq' do
  subject { [1,2,2,3] }
  it 'removes duplicates from an array' do
    expect(my_uniq(subject)).to eq([1,2,3])
  end

  it 'should not call array#uniq' do
    expect(subject).not_to receive(:uniq)
    my_uniq(subject)
  end
end

describe '#two_sum' do
  subject(:array) { [-1, 0, 2, -2, 1] }
  it 'finds pairs that sum to zero' do
    expect(two_sum(array)).to eq([[0, 4], [2, 3]])
  end

  # it 'preserves order' do
  #   expect(two_sum(array)).to start_with([0])
  # end
end

describe '#my_transpose' do
  subject(:rows) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
  it 'does not return the original array' do
    expect(my_transpose(rows)).to_not eq(rows)
  end

  it 'returns a transposed array' do
    expect(my_transpose(rows)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end

describe '#stockpicker' do
  subject(:stock) { [1,0,5,10,2] }
  subject(:stock2) { [1,5,10,0,2] }
  it 'returns a pair of days' do
    expect(stockpicker(stock)).to be_an(Array)
  end

  it 'returns best days to buy and sell' do
    expect(stockpicker(stock)).to eq([1, 3])
    expect(stockpicker(stock2)).to eq([0, 2])
  end
end
