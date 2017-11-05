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

end
