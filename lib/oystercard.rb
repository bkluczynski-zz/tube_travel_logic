MAXIMUM_BALANCE = 90;
MINIMUM_BALANCE = 1;
MINIMUM_FARE = 1;

class Oystercard

  attr_accessor :balance, :journey

  def initialize(journey = Journey.new)
    @balance = 0;
    @journey = journey
  end

  def get_balance
    balance
  end

  def top_up(amount)
    fail "maximum top-up value of $#{MAXIMUM_BALANCE} has been reached" unless balance_not_exceeded?(amount)
    self.balance += amount
  end

  def touch_in(station)
    fail "Insufficient funds, please top-up" unless can_travel?
    journey.entry_station = station
  end

  def touch_out(station)
    journey.journey_list[journey.entry_station] = station
    deduct(journey.fare)
    journey.entry_station = nil
  end

  private

  def deduct(amount)
    self.balance -= amount
  end

  def balance_not_exceeded?(amount)
    self.balance + amount <= MAXIMUM_BALANCE
  end

  def can_travel?
    get_balance >= MINIMUM_BALANCE
  end

end
