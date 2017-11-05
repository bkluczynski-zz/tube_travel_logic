class Journey

  attr_reader :journey_list
  attr_accessor :entry_station

  def initialize
    @journey_list = {};
    @entry_station = '';
  end

  def in_journey?
    entry_station ? !entry_station.empty? : false
  end

  def touch_in(station, oyster)
    fail "Insufficient funds, please top-up" unless can_travel?(oyster)
    self.entry_station = station
  end

  def touch_out(station, oyster)
    self.journey_list[entry_station] = station
    oyster.deduct(MINIMUM_FARE)
    self.entry_station = nil
  end

  private

  def can_travel?(oyster)
    oyster.get_balance >= MINIMUM_BALANCE
  end

end
