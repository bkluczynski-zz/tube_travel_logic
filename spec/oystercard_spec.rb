require 'oystercard'

describe Oystercard do

  before(:each) do
    @maximum_balance = Oystercard::MAXIMUM_BALANCE
  end

  it 'should be initialized with balanace of 0 by default' do
    expect(subject.get_balance).to eq(0)
  end


  describe '#top_up' do

    it 'should allow to topup an oyster with a chosen sum of money' do
      expect { subject.top_up(10) }.to change { subject.get_balance }.from(0).to(10)
    end

    it 'should refuse to topup an oyster above 90 pounds' do
      subject.top_up(@maximum_balance)
      expect { subject.top_up(1) }.to raise_error('maximum top-up value of $90 has been reached')
    end

  end

  describe '#deduct' do

    it 'should allow to deduct money from an oyster' do
      subject.top_up(@maximum_balance)
      expect { subject.deduct(10) }.to change { subject.get_balance }.from(@maximum_balance).to(80)

    end

  end


end
