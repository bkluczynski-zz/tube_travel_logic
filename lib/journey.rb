PENALTY = 6

class Journey

  attr_reader :journey_list
  attr_accessor :entry_station, :exit_station, :complete

  def initialize(entry_station = nil)
    @journey_list = {};
    @entry_station = entry_station;
    @complete = false;
  end

  def in_journey?
    !complete
  end

  def fare
    entry_station.nil? || exit_station.nil? ? PENALTY : MINIMUM_BALANCE
  end

  def finish(station)
    self.exit_station = station
    journey_list[entry_station] = exit_station
    self.complete = true
  end

  def start(station)
    fail "travel in progress" if entry_station
    self.entry_station = station
  end







end
