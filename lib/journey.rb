PENALTY = 6

class Journey

  attr_reader :journey_list
  attr_accessor :entry_station

  def initialize(entry_station = nil)
    @journey_list = {};
    @entry_station = entry_station;
  end

  def in_journey?
    entry_station ? !entry_station.empty? : false
  end

  def fare
    entry_station.nil? ? PENALTY : MINIMUM_BALANCE
  end






end
