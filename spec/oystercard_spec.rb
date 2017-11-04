require 'oystercard'

describe Oystercard do

  it 'should be initialized with balanace of 0 by default' do
    expect(subject.get_balance).to eq(0)
  end



end
