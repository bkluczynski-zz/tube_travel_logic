MAXIMUM_BALANCE = 90;
MINIMUM_BALANCE = 1;

class Oystercard

  attr_accessor :balance, :in_journey

  def initialize
    @balance = 0;
    @in_journey = false;
  end

  def get_balance
    balance
  end

  def top_up(amount)
    fail "maximum top-up value of $#{MAXIMUM_BALANCE} has been reached" unless balance_not_exceeded?(amount)
    self.balance += amount
  end

  def deduct(amount)
    self.balance -= amount
  end

  def in_journey?
    in_journey
  end

  def touch_in
    fail "Insufficient funds, please top-up" unless can_travel?
    self.in_journey = true
  end

  def touch_out
    self.in_journey = false
  end

  private

  def balance_not_exceeded?(amount)
    self.balance + amount <= MAXIMUM_BALANCE
  end

  def can_travel?
    balance >= MINIMUM_BALANCE
  end


end
