MAXIMUM_BALANCE = 90;
MINIMUM_BALANCE = 1;
MINIMUM_FARE = 1;

class Oystercard

  attr_accessor :balance, :entry_station
  attr_reader :journey_list

  def initialize
    @balance = 0;
    @entry_station = '';
    @journey_list = {};
  end

  def get_balance
    balance
  end

  def top_up(amount)
    fail "maximum top-up value of $#{MAXIMUM_BALANCE} has been reached" unless balance_not_exceeded?(amount)
    self.balance += amount
  end

  def in_journey?
    entry_station ? !entry_station.empty? : false
  end

  def touch_in(station)
    fail "Insufficient funds, please top-up" unless can_travel?
    self.entry_station = station
  end

  def touch_out(station)
    self.journey_list[entry_station] = station
    deduct(MINIMUM_FARE)
    self.entry_station = nil
  end

  private

  def balance_not_exceeded?(amount)
    self.balance + amount <= MAXIMUM_BALANCE
  end

  def can_travel?
    balance >= MINIMUM_BALANCE
  end

  def deduct(amount)
    self.balance -= amount
  end


end
