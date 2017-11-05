MAXIMUM_BALANCE = 90;
MINIMUM_BALANCE = 1;
MINIMUM_FARE = 1;

class Oystercard

  attr_accessor :balance

  def initialize
    @balance = 0;
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

  private

  def balance_not_exceeded?(amount)
    self.balance + amount <= MAXIMUM_BALANCE
  end

end
