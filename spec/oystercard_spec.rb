require 'oystercard'

describe Oystercard do

  it 'should be initialized with balanace of 0 by default' do
    expect(subject.get_balance).to eq(0)
  end


  describe '#top_up' do

    it 'should allow to topup an oyster with a chosen sum of money' do
      expect { subject.top_up(10) }.to change { subject.get_balance }.from(0).to(10)
    end

    it 'should refuse to topup an oyster above 90 pounds' do
      expect { subject.top_up(91) }.to raise_error('maximum top-up value of $90 has been reached')
    end

  end

end
