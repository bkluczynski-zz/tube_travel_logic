require 'oystercard'

describe Oystercard do


  it 'should be initialized with balanace of 0 by default' do
    expect(subject.get_balance).to eq(0)
  end


  describe '#top_up' do

    before(:each) do
      @maximum_balance = Oystercard::MAXIMUM_BALANCE
      @minimum_fare = Oystercard::MINIMUM_BALANCE
    end

    it 'should allow to topup an oyster with a chosen sum of money' do
      expect { subject.top_up(10) }.to change { subject.get_balance }.from(0).to(10)
    end

    it 'should refuse to topup an oyster above 90 pounds' do
      subject.top_up(@maximum_balance)
      expect { subject.top_up(1) }.to raise_error('maximum top-up value of $90 has been reached')
    end

  end

end
