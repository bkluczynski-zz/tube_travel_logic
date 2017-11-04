require 'oystercard'

describe Oystercard do

  it 'should be initialized with balanace of 0 by default' do
    expect(subject.get_balance).to eq(0)
  end

  it 'should allow to topup an oyster with a chosen sum of money' do
    expect { subject.top_up(10) }.to change { subject.get_balance }.from(0).to(10)
  end


end
