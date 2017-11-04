Maximum_value = 90;

class Oystercard

  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def get_balance
    balance
  end

  def top_up(topup)
    fail "maximum top-up value of $#{Maximum_value} has been reached" unless balance_exceeded?(topup)
    self.balance += topup
  end

  private

  def balance_exceeded?(topup)
    self.balance + topup < Maximum_value
  end


end
