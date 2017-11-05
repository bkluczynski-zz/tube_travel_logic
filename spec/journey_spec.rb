require 'journey'
require 'oystercard'

describe Journey do

  describe '#in_journey' do

    before(:each) do
      @oyster = Oystercard.new
      @oyster.top_up(1)
      subject.touch_in("Dalston Kingsland", @oyster)
    end

    it 'should be able to touch in' do
      expect(subject).to be_in_journey
    end

    it 'should be able to touch_out' do
      subject.touch_out("Shoreditch Highstreet", @oyster)
      expect(subject).not_to be_in_journey
    end

    it 'should not allow to touch in if balance is below 1 pound' do
      subject.touch_out("Shoreditch Highstreet", @oyster)
      expect { subject.touch_in("Dalston Kingsland", @oyster) }.to raise_error { "Insufficient funds, please top-up" }
    end

    it 'should deduct the minimum fare upon finishing a journey' do
      expect { subject.touch_out("Shoreditch Highstreet", @oyster) }.to change { @oyster.get_balance }.from(1).to(0)
    end

    it 'allows to store entry station' do
      expect(subject.entry_station).to eq('Dalston Kingsland')
    end

    it 'allows to store a journey history' do
      expect(subject.journey_list).to eq({})
    end

    it 'creates a list of journeys' do
      subject.touch_out('Shoreditch Highstreet', @oyster)
      expect(subject.journey_list).to eq({ 'Dalston Kingsland' => 'Shoreditch Highstreet'})
    end

  end


end
