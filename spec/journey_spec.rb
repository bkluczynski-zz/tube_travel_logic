require 'journey'
require 'oystercard'

describe Journey do

  describe '#in_journey' do

    before(:each) do
      @journey = Journey.new
      @oyster = Oystercard.new(@journey)
      @oyster.top_up(1)
      @oyster.touch_in("Dalston Kingsland")
    end

    it 'should be able to touch in' do
      expect(@journey).to be_in_journey
    end

    it 'should be able to touch_out' do
      @oyster.touch_out("Shoreditch Highstreet")
      expect(@journey).not_to be_in_journey
    end

    it 'allows to store entry station' do
      expect(@journey.entry_station).to eq('Dalston Kingsland')
    end

    it 'allows to store a journey history' do
      expect(subject.journey_list).to eq({})
    end

    it 'creates a list of journeys' do
      @oyster.touch_out('Shoreditch Highstreet')
      expect(@journey.journey_list).to eq({ 'Dalston Kingsland' => 'Shoreditch Highstreet'})
    end

  end


end
