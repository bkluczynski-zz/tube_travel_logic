class Oystercard

  attr_accessor :balance

  def initialize
    @balance = 0
  end

  def get_balance
    balance
  end

  def top_up(topup)
    self.balance += topup
  end


end
